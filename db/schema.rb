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

ActiveRecord::Schema.define(version: 20170326220259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "wards", force: :cascade do |t|
    t.integer "district_id"
    t.string  "district_name"
    t.string  "ward_id"
    t.float   "total_population"
    t.float   "dx_dev"
    t.float   "total_dvp"
    t.float   "white_population"
    t.float   "black_population"
    t.float   "hispanic_population"
    t.string  "council_person"
    t.string  "web_link"
    t.string  "global_id"
    t.string  "shape_st_area"
    t.string  "shape_st_length"
  end

end
