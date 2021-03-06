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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120528183228) do

  create_table "dish_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "meal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dish_orders", ["meal_id"], :name => "index_dish_orders_on_meal_id"
  add_index "dish_orders", ["order_id"], :name => "index_dish_orders_on_order_id"
  add_index "dish_orders", ["user_id"], :name => "index_dish_orders_on_user_id"

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "restaurant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "meals", ["restaurant_id"], :name => "index_meals_on_restaurant_id"

  create_table "orders", :force => true do |t|
    t.datetime "end_date"
    t.integer  "restaurant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "orders", ["restaurant_id"], :name => "index_orders_on_restaurant_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                :default => "", :null => false
    t.string   "first_name",                           :null => false
    t.string   "last_name",                            :null => false
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
