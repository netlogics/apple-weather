# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_02_16_152015) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zip"
    t.decimal "lat", precision: 7, scale: 4
    t.decimal "long", precision: 7, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city", "state"], name: "index_addresses_on_city_and_state"
    t.index ["street", "city", "state", "zip"], name: "index_addresses_on_street_and_city_and_state_and_zip", unique: true
    t.index ["zip"], name: "index_addresses_on_zip", unique: true
  end

  create_table "weathers", force: :cascade do |t|
    t.json "forecast"
    t.integer "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_weathers_on_address_id"
  end

  add_foreign_key "weathers", "addresses"
end
