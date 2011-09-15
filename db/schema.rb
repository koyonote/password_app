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

ActiveRecord::Schema.define(:version => 20110912082750) do

  create_table "belongings", :force => true do |t|
    t.integer  "folder_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupings", :force => true do |t|
    t.integer  "group_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "folder_id",                             :null => false
    t.string   "name",                                  :null => false
    t.string   "account"
    t.binary   "encrypted_password",                    :null => false
    t.text     "url"
    t.boolean  "deleted",            :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sugars", :force => true do |t|
    t.integer  "item_id",    :null => false
    t.binary   "salt",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "hashed_password",                    :null => false
    t.string   "salt",                               :null => false
    t.string   "name",                               :null => false
    t.integer  "role",            :default => 2
    t.boolean  "deleted",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
