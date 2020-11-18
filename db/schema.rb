# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_18_034745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combatants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "wins", default: 0, null: false
    t.integer "losses", default: 0, null: false
    t.integer "ties", default: 0, null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_combatants_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.decimal "latitude", precision: 7, scale: 5
    t.decimal "longitude", precision: 8, scale: 5
    t.integer "altitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "combatants", "locations"
end
