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

ActiveRecord::Schema.define(:version => 20130228114923) do

  create_table "actions", :force => true do |t|
    t.string   "desc"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "type",         :null => false
    t.text     "content"
    t.integer  "case_file_id"
  end

  add_index "actions", ["case_file_id"], :name => "index_actions_on_case_file_id"
  add_index "actions", ["type"], :name => "index_actions_on_type"
  add_index "actions", ["user_id", "created_at"], :name => "index_actions_on_user_id_and_created_at"

  create_table "case_files", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "open",           :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "type"
    t.text     "content"
    t.datetime "detection_time"
    t.boolean  "pending_close",  :default => false
    t.string   "participants"
  end

  add_index "case_files", ["open", "pending_close"], :name => "index_case_files_on_open_and_pending_close"
  add_index "case_files", ["type"], :name => "index_case_files_on_type"
  add_index "case_files", ["user_id", "created_at"], :name => "index_case_files_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "activated",       :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
