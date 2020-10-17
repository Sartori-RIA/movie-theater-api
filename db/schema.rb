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

ActiveRecord::Schema.define(version: 2020_10_17_134441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.string "jti", null: false
    t.string "aud"
    t.datetime "exp", null: false
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_allowlisted_jwts_on_users_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "movie_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_movie_categories_on_category_id"
    t.index ["movie_id"], name: "index_movie_categories_on_movie_id"
  end

  create_table "movie_theater_movies", force: :cascade do |t|
    t.bigint "movie_theater_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_movie_theater_movies_on_movie_id"
    t.index ["movie_theater_id"], name: "index_movie_theater_movies_on_movie_theater_id"
  end

  create_table "movie_theaters", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.string "picture"
    t.string "banner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_movie_theaters_on_deleted_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.integer "age_classification"
    t.string "banner"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_movies_on_deleted_at"
    t.index ["title"], name: "index_movies_on_title"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.bigint "movie_theater_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "limit"
    t.index ["movie_theater_id"], name: "index_rooms_on_movie_theater_id"
  end

  create_table "sections", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "room_id"
    t.bigint "movie_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_sections_on_deleted_at"
    t.index ["end_date"], name: "index_sections_on_end_date"
    t.index ["movie_id"], name: "index_sections_on_movie_id"
    t.index ["room_id"], name: "index_sections_on_room_id"
    t.index ["start_date"], name: "index_sections_on_start_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "cell_phone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["cell_phone"], name: "index_users_on_cell_phone", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "allowlisted_jwts", "users", column: "users_id"
  add_foreign_key "movie_categories", "categories"
  add_foreign_key "movie_categories", "movies"
  add_foreign_key "movie_theater_movies", "movie_theaters"
  add_foreign_key "movie_theater_movies", "movies"
  add_foreign_key "rooms", "movie_theaters"
  add_foreign_key "sections", "movies"
  add_foreign_key "sections", "rooms"
end
