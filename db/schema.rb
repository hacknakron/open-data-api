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

ActiveRecord::Schema.define(version: 20160910204558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "data_controller_worked", id: false, force: :cascade do |t|
    t.string "col1"
  end

  create_table "refresh_results", id: :integer, force: :cascade do |t|
    t.string  "action"
    t.string  "csv_file"
    t.integer "record_count"
    t.string  "url"
  end

  create_table "view_akron_wards", primary_key: "wardobjectid", id: :integer, force: :cascade do |t|
    t.integer "wardnumber"
    t.string  "wardname",                    limit: 7
    t.string  "wardcode",                    limit: 3
    t.integer "totalpopulation"
    t.integer "deviationfromaverage"
    t.decimal "deviationfromaveragepercent",             precision: 7,  scale: 5
    t.integer "whitepopulation"
    t.decimal "whitepopulationpercent",                  precision: 7,  scale: 5
    t.integer "blackpopulation"
    t.decimal "blackpopulationpercent",                  precision: 7,  scale: 5
    t.integer "hispanicpopulation"
    t.decimal "hispanicpopulationpercent",               precision: 7,  scale: 5
    t.string  "councilperson",               limit: 50
    t.string  "councilpersonweblink",        limit: 100
    t.uuid    "wardglobalid"
    t.decimal "wardshape_starea",                        precision: 13, scale: 2
    t.decimal "wardshape_stlength",                      precision: 13, scale: 2
    t.text    "column19"
  end

end
