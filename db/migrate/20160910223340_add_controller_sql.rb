class AddControllerSql < ActiveRecord::Migration[5.0]
  def up
    sql = <<-SQL

      DROP FUNCTION IF EXISTS clean_2012wards_raw_stage();
      DROP FUNCTION IF EXISTS migrate_target_2012wards();
      DROP FUNCTION IF EXISTS migrate_stage_2012wards();
      DROP FUNCTION IF EXISTS validate_2012wards();
      DROP FUNCTION IF EXISTS data_controller(_action VARCHAR, csv_file_name VARCHAR);

      DROP TABLE IF EXISTS _stage_2012wards CASCADE;

      CREATE TABLE IF NOT EXISTS _stage_2012wards(
         ward_object_id VARCHAR,
         ward_number VARCHAR,
         ward_name VARCHAR,
          ward_code VARCHAR,
         total_population VARCHAR,
         deviation_from_average VARCHAR,
         deviation_from_average_percent VARCHAR,
         white_population VARCHAR,
         white_population_percent VARCHAR,
         black_population VARCHAR,
         black_population_percent VARCHAR,
         hispanic_population VARCHAR,
         hispanic_population_percent VARCHAR,
         council_person VARCHAR,
         council_person_webLink VARCHAR,
         ward_guid VARCHAR,
         ward_shape_st_area VARCHAR,
         ward_shape_st_length VARCHAR,
         reason VARCHAR,
         PRIMARY KEY (ward_object_id)
      );

      DROP TABLE IF EXISTS _stage_2012wards_errors CASCADE;

      CREATE TABLE IF NOT EXISTS _stage_2012wards_errors(
         reason VARCHAR,
         ward_object_id VARCHAR,
         ward_number VARCHAR,
         ward_name VARCHAR,
          ward_code VARCHAR,
         total_population VARCHAR,
         deviation_from_average VARCHAR,
         deviation_from_average_percent VARCHAR,
         white_population VARCHAR,
         white_population_percent VARCHAR,
         black_population VARCHAR,
         black_population_percent VARCHAR,
         hispanic_population VARCHAR,
         hispanic_population_percent VARCHAR,
         council_person VARCHAR,
         council_person_webLink VARCHAR,
         ward_guid VARCHAR,
         ward_shape_st_area VARCHAR,
         ward_shape_st_length VARCHAR,
         PRIMARY KEY (ward_object_id)
      );

      DROP TABLE IF EXISTS view_akron_wards CASCADE;

      CREATE TABLE IF NOT EXISTS view_akron_wards(
         ward_object_id int,
         ward_number int,
         ward_name varchar(7),
          ward_code varchar(3),
         total_population int,
         deviation_from_average int,
         deviation_from_average_percent decimal(7,5),
         white_population int,
         white_population_percent decimal(7,5),
         black_population int,
         black_population_percent decimal(7,5),
         hispanic_population int,
         hispanic_population_percent decimal(7,5),
         council_person varchar(50),
         council_person_webLink varchar(100),
         ward_guid UUID,
         ward_shape_st_area decimal(13,2),
         ward_shape_st_length decimal (13,2),
         PRIMARY KEY (ward_object_id)
      );

      DROP TABLE IF EXISTS refresh_results CASCADE;

      CREATE TABLE IF NOT EXISTS refresh_results (
        id integer,
        action VARCHAR,
        csv_file VARCHAR,
        record_count INT,
        url VARCHAR,
        start_time timestamp,
        PRIMARY KEY (id)
      );

      INSERT INTO refresh_results VALUES (1, 'END');

      CREATE OR REPLACE FUNCTION migrate_stage_2012wards()
      RETURNS void AS $$
      BEGIN
        TRUNCATE TABLE _stage_2012wards;
        INSERT INTO _stage_2012wards (select OBJECTID_12,DIST_ID,DIST_NAME,Ward,TOTAL,DX_DEV,TOTAL_DVP,WHITE,WHITE_P,BLACK,BLACK_P,HISPANIC,HISPANIC_P,COUNCIL_PERSON,WEB_LINK,GlobalID,Shape_STArea__,Shape_STLength__ FROM _raw_2012wards);
      END;
      $$ LANGUAGE plpgsql;

      CREATE OR REPLACE FUNCTION clean_2012wards_raw_stage()
      RETURNS void AS $$
      BEGIN
        UPDATE _stage_2012wards
        SET total_population = replace(left(total_population, strpos(total_population, '.') - 1),',','')
        ,deviation_from_average = replace(left(deviation_from_average, strpos(deviation_from_average, '.') - 1),',','')
        ,deviation_from_average_percent = replace(left(deviation_from_average_percent, strpos(deviation_from_average_percent, '.') + 5),',','')
        ,white_population = replace(left(white_population, strpos(white_population, '.') - 1),',','')
        ,white_population_percent = replace(left(white_population_percent, strpos(white_population_percent, '.') + 5),',','')
        ,black_population = replace(left(black_population, strpos(black_population, '.') - 1),',','')
        ,black_population_percent = replace(left(black_population_percent, strpos(black_population_percent, '.') + 5),',','')
        ,hispanic_population = replace(left(hispanic_population, strpos(hispanic_population, '.') - 1),',','')
        ,hispanic_population_percent = replace(left(hispanic_population_percent, strpos(hispanic_population_percent, '.') + 5),',','')
        ,council_person_weblink = LOWER(council_person_weblink)
        ,ward_shape_st_area = replace(left(ward_shape_st_area, strpos(ward_shape_st_area, '.') + 5),',','')
        ,ward_shape_st_length = replace(left(ward_shape_st_length, strpos(ward_shape_st_length, '.') + 5),',','')
        ;
      END;
      $$ LANGUAGE plpgsql;

      CREATE OR REPLACE FUNCTION validate_2012wards()
      RETURNS void AS $$
      BEGIN
        UPDATE _stage_2012wards
        SET reason = COALESCE(reason,'')||'Population greater than 19,600; '
        WHERE total_population::integer <= 19600 AND COALESCE(reason,'') not ilike '%Population greater than 19,600%'
        ;
        TRUNCATE TABLE _stage_2012wards_errors
        ;
        INSERT INTO _stage_2012wards_errors
        ( SELECT * FROM _stage_2012wards WHERE reason IS NOT NULL
        );
      END;
      $$ LANGUAGE plpgsql;

      CREATE OR REPLACE FUNCTION migrate_target_2012wards()
      RETURNS void AS $$
      BEGIN
        TRUNCATE TABLE view_akron_wards;
        INSERT INTO view_akron_wards (SELECT ward_object_id::integer,
        ward_number::integer,
        ward_name,
        ward_code,
        total_population::integer,
        deviation_from_average::integer,
        deviation_from_average_percent::decimal(7,5),
        white_population::integer,
        white_population_percent::decimal(7,5),
        black_population::integer,
        black_population_percent::decimal(7,5),
        hispanic_population::integer,
        hispanic_population_percent::decimal(7,5),
        council_person,
        council_person_webLink,
        ward_guid::uuid,
        ward_shape_st_area::decimal(13,2),
        ward_shape_st_length::decimal(13,2)
        FROM _stage_2012wards WHERE reason IS NULL);
      END;
      $$ LANGUAGE plpgsql;

      CREATE OR REPLACE FUNCTION data_controller(_action VARCHAR, csv_file_name VARCHAR)
      RETURNS text AS $$
      DECLARE
          result text;
      DECLARE
          _count integer;
      BEGIN
        SELECT COUNT(*) FROM refresh_results WHERE action = 'END' INTO _count;
        IF _count > 0 THEN
         _count = 1;
         TRUNCATE TABLE refresh_results;
         INSERT INTO refresh_results VALUES (_count,'START',null,null,null,NOW());
         _count=_count + 1;
          IF _action = 'IMPORT' THEN
            SELECT migrate_target_2012wards() INTO result;
            INSERT INTO refresh_results VALUES (_count,_action,csv_file_name,(SELECT count(*) from view_akron_wards),'http//:localhost:3000/view_akron_wards',NOW());
            _count=_count + 1;
          ELSIF _action = 'GET' OR _action = 'VALIDATE' THEN
            IF csv_file_name IN('ALL','2012wards') THEN
              SELECT migrate_stage_2012wards() INTO result;
              INSERT INTO refresh_results VALUES (_count,_action,csv_file_name,(SELECT count(*) from _stage_2012wards),'',NOW());
              _count=_count + 1;
              SELECT clean_2012wards_raw_stage() INTO result;
              SELECT validate_2012wards() INTO result;
              INSERT INTO refresh_results VALUES (_count,_action,csv_file_name,(SELECT count(*) from _stage_2012wards_errors),'http//:localhost:3000/view_akron_wards_errors',NOW());
              _count=_count + 1;
            END IF;
            IF csv_file_name IN('ALL','CAMASalesData') THEN
              --SELECT migrate_stage_CAMASalesData() INTO result;
              --SELECT clean_CAMASalesData_raw_stage() INTO result;
              --SELECT validate_CAMASalesData() INTO result;

            END IF;
          ELSE INSERT INTO refresh_results VALUES (_count,'Invalid Action: '||_action,csv_file_name,NULL,'',NOW());
          _count=_count + 1;
          END IF;
          INSERT INTO refresh_results VALUES (_count,'END',null,null,null,NOW());
          _count=_count + 1;
        ELSE RETURN 'Already Processing';
        END IF;
        RETURN result;
      END;
      $$ LANGUAGE plpgsql;
    SQL

    execute sql
  end
end
