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

ActiveRecord::Schema.define(version: 2020_04_17_134809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booster_packs", force: :cascade do |t|
    t.integer "card_number"
    t.string "card_rarity"
    t.bigint "card_id", null: false
    t.bigint "booster_set_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booster_set_id"], name: "index_booster_packs_on_booster_set_id"
    t.index ["card_id"], name: "index_booster_packs_on_card_id"
  end

  create_table "booster_sets", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.string "card"
    t.string "monster_attribute"
    t.string "monster_type"
    t.string "category"
    t.integer "level"
    t.integer "atk"
    t.integer "def"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booster_packs", "booster_sets"
  add_foreign_key "booster_packs", "cards"
end
