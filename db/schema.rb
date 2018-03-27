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

ActiveRecord::Schema.define(version: 20180327175746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
  end

  create_table "education_to_profiles", force: :cascade do |t|
    t.bigint "education_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["education_id"], name: "index_education_to_profiles_on_education_id"
    t.index ["profile_id"], name: "index_education_to_profiles_on_profile_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "organisation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_groups_on_cluster_id"
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "title"
    t.string "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "hobby_to_profiles", force: :cascade do |t|
    t.bigint "hobby_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hobby_id"], name: "index_hobby_to_profiles_on_hobby_id"
    t.index ["profile_id"], name: "index_hobby_to_profiles_on_profile_id"
  end

  create_table "language_to_profiles", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_to_profiles_on_language_id"
    t.index ["profile_id"], name: "index_language_to_profiles_on_profile_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "messageable_type"
    t.bigint "messageable_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageable_type", "messageable_id"], name: "index_messages_on_messageable_type_and_messageable_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "counter"
    t.index ["group_id"], name: "index_notifications_on_group_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "profileclusters", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_profileclusters_on_cluster_id"
    t.index ["profile_id"], name: "index_profileclusters_on_profile_id"
  end

  create_table "profilegroups", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_profilegroups_on_group_id"
    t.index ["profile_id"], name: "index_profilegroups_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "birth_place"
    t.date "birth_date"
    t.string "nickname"
    t.string "living_place"
    t.string "gender"
    t.string "gender_identity"
    t.string "sexuality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "birth_place_latitude"
    t.float "birth_place_longitude"
    t.float "living_place_latitude"
    t.float "living_place_longitude"
    t.boolean "email"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.boolean "online", default: false
    t.datetime "last_seen_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "education_to_profiles", "educations"
  add_foreign_key "education_to_profiles", "profiles"
  add_foreign_key "groups", "clusters"
  add_foreign_key "hobby_to_profiles", "hobbies"
  add_foreign_key "hobby_to_profiles", "profiles"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "groups"
  add_foreign_key "notifications", "users"
  add_foreign_key "profileclusters", "clusters"
  add_foreign_key "profileclusters", "profiles"
  add_foreign_key "profilegroups", "groups"
  add_foreign_key "profilegroups", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "profiles"
end
