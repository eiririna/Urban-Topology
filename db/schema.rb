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

ActiveRecord::Schema[7.0].define(version: 2023_06_04_202543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "route_stops", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_stops_on_route_id"
    t.index ["stop_id"], name: "index_route_stops_on_stop_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.string "route"
    t.string "ref"
    t.string "colour"
    t.string "network"
    t.string "operator"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "lon"
    t.string "ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "route_stops", "routes"
  add_foreign_key "route_stops", "stops"
end
