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

ActiveRecord::Schema.define(version: 2023_01_15_065940) do

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "community_topic_id", null: false
    t.bigint "community_topic_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_topic_id"], name: "index_articles_on_community_topic_id"
    t.index ["community_topic_tag_id"], name: "index_articles_on_community_topic_tag_id"
  end

  create_table "communities", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "community_reviews", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_community_reviews_on_user_id"
  end

  create_table "community_tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "community_topic_tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "community_topics", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "community_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_genres_on_community_id"
    t.index ["community_tag_id"], name: "index_genres_on_community_tag_id"
  end

  create_table "ondemand_categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ondemand_nets", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "ondemand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ondemand_id"], name: "index_ondemand_nets_on_ondemand_id"
  end

  create_table "ondemand_reals", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "ondemand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ondemand_id"], name: "index_ondemand_reals_on_ondemand_id"
  end

  create_table "ondemand_searches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ondemand_id", null: false
    t.bigint "ondemand_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ondemand_id"], name: "index_ondemand_searches_on_ondemand_id"
    t.index ["ondemand_tag_id"], name: "index_ondemand_searches_on_ondemand_tag_id"
  end

  create_table "ondemand_tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ondemands", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "articles", "community_topic_tags"
  add_foreign_key "articles", "community_topics"
  add_foreign_key "communities", "users"
  add_foreign_key "community_reviews", "users"
  add_foreign_key "genres", "communities"
  add_foreign_key "genres", "community_tags"
  add_foreign_key "ondemand_nets", "ondemands"
  add_foreign_key "ondemand_reals", "ondemands"
  add_foreign_key "ondemand_searches", "ondemand_tags"
  add_foreign_key "ondemand_searches", "ondemands"
end
