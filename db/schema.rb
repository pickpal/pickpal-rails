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

ActiveRecord::Schema.define(version: 20180402131959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "name"], name: "index_competitors_on_type_and_name", unique: true
  end

  create_table "match_competitors", id: :serial, force: :cascade do |t|
    t.integer "match_id"
    t.integer "competitor_id"
    t.integer "ordinal", default: 0, null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id", "competitor_id"], name: "index_match_competitors_on_match_id_and_competitor_id", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "tournament_id"
    t.integer "ordinal", default: 0, null: false
    t.datetime "starts_at"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id", "ordinal"], name: "index_matches_on_tournament_id_and_ordinal"
  end

  create_table "reddit_users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "tournament_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "tournament_desc_idx"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.string "type"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id", "name", "type"], name: "index_tournaments_on_parent_id_and_name_and_type"
  end

  add_foreign_key "match_competitors", "competitors"
  add_foreign_key "match_competitors", "matches"
  add_foreign_key "matches", "tournaments"
end
