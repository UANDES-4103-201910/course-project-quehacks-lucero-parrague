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

ActiveRecord::Schema.define(version: 2019_05_27_165639) do

  create_table "comments", force: :cascade do |t|
    t.datetime "public_date"
    t.integer "user_id"
    t.integer "post_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "public_date"
    t.string "city"
    t.string "country"
    t.string "gps"
    t.boolean "open_or_closed"
    t.boolean "solved"
    t.boolean "visible"
    t.boolean "dumpster"
    t.string "fileName"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_reports_on_post_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sharedposts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "posts_id"
    t.datetime "date_of_sharing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_sharedposts_on_posts_id"
    t.index ["user_id"], name: "index_sharedposts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "admin_level"
    t.string "name"
    t.string "last_name"
    t.string "password"
    t.string "biography"
    t.string "gps"
    t.string "city"
    t.string "country"
    t.string "imageName"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.boolean "positive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
