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

ActiveRecord::Schema.define(version: 20170124032002) do

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "slug",        limit: 64, null: false
    t.string   "code"
    t.string   "name"
    t.string   "common_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["slug"], name: "index_countries_on_slug", unique: true, using: :btree
  end

  create_table "place_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "place_id",              null: false
    t.string   "locale",     limit: 16
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["place_id", "locale"], name: "index_place_details_on_place_id_and_locale", unique: true, using: :btree
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "alternate_id", limit: 64,                         null: false
    t.string   "url"
    t.decimal  "latitude",                precision: 8, scale: 6
    t.decimal  "longitude",               precision: 9, scale: 6
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["alternate_id"], name: "index_places_on_alternate_id", unique: true, using: :btree
  end

end
