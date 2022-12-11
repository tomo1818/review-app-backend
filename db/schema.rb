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

ActiveRecord::Schema[7.0].define(version: 2022_12_11_093605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
    t.index ["group_id"], name: "index_categories_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid", default: "b4c4eaf1-e465-4e96-8444-5be79a09ba00", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_photos_on_shop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author", null: false
    t.text "comment", null: false
    t.integer "score", null: false
    t.bigint "shop_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shop_tags", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_tags_on_shop_id"
    t.index ["tag_id"], name: "index_shop_tags_on_tag_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "group_id", null: false
    t.bigint "category_id", null: false
    t.integer "avg_score", default: 0, null: false
    t.boolean "done", default: false, null: false
    t.string "visit_day", default: "2022月12日1日", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_string"
    t.string "url"
    t.string "description", null: false
    t.float "latitude", default: 35.60439042577099, null: false
    t.float "longitude", default: 139.68384504318237, null: false
    t.integer "amount_of_money", default: 0, null: false
    t.string "address", default: "〒145-0061 東京都大田区 石川町1丁目31-1", null: false
    t.index ["category_id"], name: "index_shops_on_category_id"
    t.index ["group_id"], name: "index_shops_on_group_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_tags_on_group_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "categories", "groups"
  add_foreign_key "photos", "shops"
  add_foreign_key "reviews", "shops"
  add_foreign_key "reviews", "users"
  add_foreign_key "shop_tags", "shops"
  add_foreign_key "shop_tags", "tags"
  add_foreign_key "shops", "categories"
  add_foreign_key "shops", "groups"
  add_foreign_key "tags", "groups"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
end
