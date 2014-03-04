# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140304105751) do

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.string   "zipcode"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "cate"
    t.string   "keywords"
    t.string   "reply_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reply_type"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "weixin_cover", default: false
  end

  create_table "product_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "body_html"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "cover"
    t.string   "name"
    t.string   "content"
    t.decimal  "price",        precision: 10, scale: 2
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "buy_count"
    t.integer  "like_count"
    t.text     "body"
    t.text     "body_html"
    t.string   "weixin_url"
    t.boolean  "public",                                default: true
    t.datetime "deleted_at"
    t.boolean  "is_recommend"
    t.boolean  "is_onsale"
    t.string   "spec_note"
    t.integer  "order_point"
    t.boolean  "spec_flag",                             default: false
  end

  create_table "send_mails", force: true do |t|
    t.string   "type"
    t.string   "receivers"
    t.text     "content"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "shopping_id"
    t.integer  "count"
    t.decimal  "amount",       precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
    t.decimal  "price",        precision: 10, scale: 2, default: 0.0
    t.string   "product_name"
    t.string   "product_unit"
  end

  create_table "shoppings", force: true do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.decimal  "amount",           precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "remark"
    t.datetime "deleted_at"
    t.string   "customer_build"
    t.string   "status"
    t.integer  "follower_id"
    t.string   "receive_time"
    t.decimal  "actual_amount",    precision: 10, scale: 2, default: 0.0
    t.string   "school_area"
    t.string   "channel"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "role"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree

  create_table "weixin_messages", force: true do |t|
    t.string   "from_user"
    t.string   "to_user"
    t.string   "type"
    t.datetime "create_time"
    t.string   "text_content"
    t.string   "msg_id"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weixin_users", force: true do |t|
    t.string   "open_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "group"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weixin_users", ["open_id"], name: "index_weixin_users_on_open_id", unique: true, using: :btree

end
