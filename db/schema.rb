# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160910233340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "_raw_2012wards", force: :cascade do |t|
    t.string "OBJECTID_12",      limit: 300
    t.string "DIST_ID",          limit: 300
    t.string "DIST_NAME",        limit: 300
    t.string "Ward",             limit: 300
    t.string "TOTAL",            limit: 300
    t.string "DX_DEV",           limit: 300
    t.string "TOTAL_DVP",        limit: 300
    t.string "WHITE",            limit: 300
    t.string "WHITE_P",          limit: 300
    t.string "BLACK",            limit: 300
    t.string "BLACK_P",          limit: 300
    t.string "HISPANIC",         limit: 300
    t.string "HISPANIC_P",       limit: 300
    t.string "COUNCIL_PERSON",   limit: 300
    t.string "WEB_LINK",         limit: 300
    t.string "GlobalID",         limit: 300
    t.string "Shape_STArea__",   limit: 300
    t.string "Shape_STLength__", limit: 300
  end

  create_table "_stage_2012wards", primary_key: "ward_object_id", id: :string, force: :cascade do |t|
    t.string "ward_number"
    t.string "ward_name"
    t.string "ward_code"
    t.string "total_population"
    t.string "deviation_from_average"
    t.string "deviation_from_average_percent"
    t.string "white_population"
    t.string "white_population_percent"
    t.string "black_population"
    t.string "black_population_percent"
    t.string "hispanic_population"
    t.string "hispanic_population_percent"
    t.string "council_person"
    t.string "council_person_weblink"
    t.string "ward_guid"
    t.string "ward_shape_st_area"
    t.string "ward_shape_st_length"
    t.string "reason"
  end

  create_table "_stage_2012wards_errors", primary_key: "ward_object_id", id: :string, force: :cascade do |t|
    t.string "reason"
    t.string "ward_number"
    t.string "ward_name"
    t.string "ward_code"
    t.string "total_population"
    t.string "deviation_from_average"
    t.string "deviation_from_average_percent"
    t.string "white_population"
    t.string "white_population_percent"
    t.string "black_population"
    t.string "black_population_percent"
    t.string "hispanic_population"
    t.string "hispanic_population_percent"
    t.string "council_person"
    t.string "council_person_weblink"
    t.string "ward_guid"
    t.string "ward_shape_st_area"
    t.string "ward_shape_st_length"
  end

  create_table "community_learning_centers", force: :cascade do |t|
    t.string   "school_name", null: false
    t.string   "address",     null: false
    t.string   "gym_1"
    t.string   "gym_2"
    t.string   "gym_3"
    t.string   "auditorium"
    t.string   "cafeteria"
    t.string   "lrc"
    t.string   "music"
    t.string   "art"
    t.string   "classroom"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "refresh_results", id: :integer, force: :cascade do |t|
    t.string   "action"
    t.string   "csv_file"
    t.integer  "record_count"
    t.string   "url"
    t.datetime "start_time"
  end

  create_table "view_akron_wards", primary_key: "ward_object_id", id: :integer, force: :cascade do |t|
    t.integer "ward_number"
    t.string  "ward_name",                      limit: 7
    t.string  "ward_code",                      limit: 3
    t.integer "total_population"
    t.integer "deviation_from_average"
    t.decimal "deviation_from_average_percent",             precision: 7,  scale: 5
    t.integer "white_population"
    t.decimal "white_population_percent",                   precision: 7,  scale: 5
    t.integer "black_population"
    t.decimal "black_population_percent",                   precision: 7,  scale: 5
    t.integer "hispanic_population"
    t.decimal "hispanic_population_percent",                precision: 7,  scale: 5
    t.string  "council_person",                 limit: 50
    t.string  "council_person_weblink",         limit: 100
    t.uuid    "ward_guid"
    t.decimal "ward_shape_st_area",                         precision: 13, scale: 2
    t.decimal "ward_shape_st_length",                       precision: 13, scale: 2
  end

end
