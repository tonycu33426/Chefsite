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

ActiveRecord::Schema.define(version: 20160223111547) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodtypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "metric_unit"
    t.string   "imperial_unit"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.decimal  "metric_pack_size"
    t.decimal  "imperial_pack_size"
    t.integer  "foodtype_id",        default: 1
  end

  add_index "ingredients", ["foodtype_id"], name: "index_ingredients_on_foodtype_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "state",           default: "new"
    t.string   "event_name"
    t.date     "event_date"
    t.time     "event_time"
    t.integer  "invite_template"
    t.string   "invite_words"
    t.date     "feedback_date"
    t.string   "feedback_text"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "product_ingredients", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "ingredient_id"
    t.decimal  "metric_qty"
    t.decimal  "imperial_qty"
    t.decimal  "metric_pack_size"
    t.decimal  "imperial_pack_size"
    t.string   "metric_unit"
    t.string   "imperial_unit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "product_ingredients", ["ingredient_id"], name: "index_product_ingredients_on_ingredient_id"
  add_index "product_ingredients", ["product_id"], name: "index_product_ingredients_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "image"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", default: 1
    t.string   "brief"
    t.string   "description"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "recipes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sequence"
    t.decimal  "time_before_meal"
    t.string   "instructions"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "recipes", ["product_id"], name: "index_recipes_on_product_id"

  create_table "timerecipes", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "time_before_meal"
    t.string   "instructions"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "timerecipes", ["product_id"], name: "index_timerecipes_on_product_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "postal_code"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
