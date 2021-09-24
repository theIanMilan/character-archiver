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

ActiveRecord::Schema.define(version: 2021_09_20_140754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backstories", force: :cascade do |t|
    t.bigint "character_id"
    t.text "body"
    t.text "personality"
    t.text "ideals"
    t.text "bonds"
    t.text "flaws"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_backstories_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "character_name"
    t.string "character_portrait_URL"
    t.string "portrait_credit_artist"
    t.string "portrait_credit_URL"
    t.string "background"
    t.integer "alignment"
    t.string "race"
    t.string "sex"
    t.string "gender"
    t.string "sexual_orientation"
    t.boolean "private_character", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["background"], name: "index_characters_on_background"
    t.index ["race"], name: "index_characters_on_race"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "class_and_levels", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "character_class", null: false
    t.string "character_subclass", null: false
    t.integer "character_level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_class", "character_id"], name: "index_class_and_levels_on_character_class_and_character_id", unique: true
    t.index ["character_id"], name: "index_class_and_levels_on_character_id"
    t.index ["character_subclass", "character_id"], name: "idx_class_and_levels_on_char_subclass_and_char_id", unique: true
  end

  create_table "physical_attributes", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "age"
    t.string "height"
    t.string "weight"
    t.string "eyes"
    t.string "skin"
    t.string "hair"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_physical_attributes_on_character_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "display_name"
    t.string "avatar_URL"
    t.text "about_me"
    t.date "date_of_birth"
    t.string "location"
    t.string "twitter_username"
    t.string "instagram_username"
    t.string "discord_username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.boolean "searching_for_connections", default: true, null: false
    t.text "search_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_searches_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "role", default: 9
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "profiles", "users"
end
