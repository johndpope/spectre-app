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

ActiveRecord::Schema.define(:version => 20130218111502) do

  create_table "actions", :force => true do |t|
    t.string   "desc"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type",       :null => false
    t.text     "content"
    t.integer  "case_id"
  end

  add_index "actions", ["case_id"], :name => "index_actions_on_case_id"
  add_index "actions", ["type"], :name => "index_actions_on_type"
  add_index "actions", ["user_id", "created_at"], :name => "index_actions_on_user_id_and_created_at"

  create_table "cases", :force => true do |t|
    t.integer  "incident_id"
    t.integer  "user_id"
    t.boolean  "open"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cases", ["user_id", "incident_id", "created_at"], :name => "index_cases_on_user_id_and_incident_id_and_created_at"

  create_table "incidents", :force => true do |t|
    t.string   "type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "content"
    t.datetime "detection_time"
  end

  add_index "incidents", ["created_at"], :name => "index_incidents_on_created_at"
  add_index "incidents", ["detection_time"], :name => "index_incidents_on_detection_time"

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
