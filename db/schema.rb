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

ActiveRecord::Schema.define(:version => 20111014121125) do

  create_table "assignments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "deployments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "companies_id"
    t.integer  "products_id"
  end

  create_table "employment_statuses", :force => true do |t|
    t.string   "is_past"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_permalink"
    t.string   "person_permalink"
  end

  create_table "folders", :force => true do |t|
    t.integer  "research_id"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funding_rounds", :force => true do |t|
    t.datetime "date_of_record"
    t.integer  "money"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funding_rounds", ["company_id"], :name => "index_funds_on_company_id"

  create_table "notifications", :force => true do |t|
    t.datetime "next_notification"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", :force => true do |t|
    t.text     "description"
    t.text     "address1"
    t.text     "address2"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "state_code"
    t.string   "country_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_permalink"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "permalink"
  end

  add_index "people", ["first_name", "permalink"], :name => "index_people_on_first_name_and_permalink"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.string   "company_permalink"
  end

  create_table "staff_levels", :force => true do |t|
    t.integer  "number_of_employees"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_permalink"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "progress",   :default => 0
    t.integer  "topic_id"
    t.string   "version"
  end

  create_table "updates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "type_of_update"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "progress_status"
  end

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastName"
  end

end
