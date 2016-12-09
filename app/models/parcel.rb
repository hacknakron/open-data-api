class Parcel < ApplicationRecord
validates :object_id, presence: true (OBJECTID
validates :inspection_status, presence: true (InspectionStatus
validates :survey_date, presence: true (SURVEY_DATE
validates :parcel_id, presence: true (PARID
validates :frontage, presence: true (FRONTAGE
validates :depth, presence: true (DEPTH
validates :area_sqft, presence: true (AREA_SQFT
validates :area_acres, presence: true (AREA_ACRES
validates :land_value, presence: true (LAND_VAL
validates :building_value, presence: true (BLDG_VAL
validates :zoning, presence: true (ZONING
validates :current_use, presence: true (CURR_USE
validates :license, presence: true (LICENSE
validates :preferred_reuse, presence: true (PREF_USE
validates :second_use, presence: true (SECND_USE
validates :recommended_price, presence: true (REC_PRICE
validates :comments, presence: true (COMMENTS
validates :neighborhood, presence: true (NBRHD
validates :ward_id, presence: true (WARD_2012
validates :land_use_code, presence: true (LUC
validates :street_number, presence: true (STNUMB
validates :street_number_2, presence: true (STNUMB2
validates :street_direction, presence: true (STDIR
validates :street_name, presence: true (STNAME
validates :street_type, presence: true (STTYPE
validates :state_fips, presence: true (STATEFP10
validates :county_fips, presence: true (COUNTYFP10
validates :tract_fips, presence: true (TRACTCE10
validates :block_group_number, presence: true (BLKGRPCE10
validates :block_group_id, presence: true (GEOID10
validates :area_and_tract_name, presence: true (NAMELSAD10
validates :maf_tiger_code, presence: true (MTFCC10
validates :functional_status, presence: true (FUNCSTAT10
validates :land_area, presence: true (ALAND10
validates :water_area, presence: true (AWATER10
validates :internal_latitude, presence: true (INTPTLAT10
validates :internal_longitude, presence: true (INTPTLON10
validates :id, presence: true (ID
validates :cdbg_uigid, presence: true (CDBGUOGID
validates :cdbg_name, presence: true (CDBGNAME
validates :state_abbreviation, presence: true (STUSAB
validates :cdbg_type, presence: true (CDBGTY
validates :state, presence: true (STATE
validates :county, presence: true (COUNTY
validates, presence: true (COUNTYNAME
validates :tract, presence: true (TRACT
validates :block_group, presence: true (BLKGRP
validates :low_and_mod_income_count, presence: true (LOWMOD
validates :low_and_mod_income_count_potential, presence: true (LOWMODUNIV
validates :geo_id, presence: true (GEOID
validates :percent_low_mod_income, presence: true (PCTLOWMOD
validates :tract_ce_10_1, presence: true (TRACTCE10_1
validates :first_stat, presence: true (FIRST_STAT, presence: true
validates :first_coun, presence: true (FIRST_COUN, presence: true
validates :first_trac, presence: true (FIRST_TRAC, presence: true
validates :first_mtfc, presence: true (FIRST_MTFC, presence: true
validates :first_func, presence: true (FIRST_FUNC, presence: true
validates :sum_land_area, presence: true (SUM_ALAND1, presence: true
validates :sum_water_area, presence: true (SUM_AWATER, presence: true
validates :first_cdbg, presence: true (FIRST_CDBG, presence: true
validates :first_cd_1, presence: true (FIRST_CD_1, presence: true
validates :first_stus, presence: true (FIRST_STUS, presence: true
validates :first_cd_2, presence: true (FIRST_CD_2, presence: true
validates :first_st_1, presence: true (FIRST_ST_1, presence: true
validates :first_co_1, presence: true (FIRST_CO_1, presence: true
validates :first_co_2, presence: true (FIRST_CO_2, presence: true
validates :first_tr_1, presence: true (FIRST_TR_1, presence: true
validates :PCT_LMI, presence: true
validates :Shape_STArea_1, presence: true
validates :Shape_STLength_1, presence: true
validates :SHAPE_Length, presence: true
validates :SHAPE_Area, presence: true
end
