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

ActiveRecord::Schema.define(version: 20170422165605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "land_use_codes", force: :cascade do |t|
    t.integer  "object_id"
    t.integer  "value"
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "use_class"
  end

  create_table "parcel_appraisals", force: :cascade do |t|
    t.integer  "object_id"
    t.integer  "parcel_id"
    t.integer  "land_value"
    t.integer  "building_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "parcel_sales", force: :cascade do |t|
    t.integer  "object_id",         null: false
    t.integer  "parcel_id",         null: false
    t.datetime "sales_date",        null: false
    t.integer  "price"
    t.datetime "transaction_date"
    t.string   "previous_owner"
    t.string   "new_owner"
    t.integer  "approximate_total"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.integer  "object_id"
    t.integer  "parcel_id"
    t.integer  "tax_year"
    t.string   "alternate_id"
    t.integer  "address_number"
    t.string   "address_direction"
    t.string   "address_street"
    t.string   "address_suffix"
    t.string   "address_suffix_2"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "acres"
    t.string   "current_resident_1"
    t.string   "current_resident_2"
    t.string   "owner_1"
    t.string   "owner_2"
    t.string   "owner_address_1"
    t.string   "owner_address_2"
    t.string   "owner_address_3"
    t.integer  "owner_zip_code"
    t.integer  "owner_zip_code_2"
    t.string   "owner_city"
    t.string   "owner_state"
    t.string   "description"
    t.integer  "land_use_code_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "city_owned",         default: false
    t.integer  "use_code"
    t.string   "use_class"
  end

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
    t.integer "object_id"
    t.string  "district_id"
    t.string  "district_name"
    t.string  "ward_name"
    t.string  "ward_id"
    t.float   "total_population"
    t.float   "white_population"
    t.float   "black_population"
    t.float   "hispanic_population"
    t.string  "council_person"
    t.string  "web_link"
  end

end
