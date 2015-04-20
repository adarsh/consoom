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

ActiveRecord::Schema.define(:version => 20120224191513) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id",   :null => false
    t.string   "source_type", :null => false
  end

  add_index "activities", ["created_at"], :name => "index_activities_on_created_at"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "amazon_items", :force => true do |t|
    t.string   "asin"
    t.string   "title"
    t.string   "author"
    t.string   "image_url"
    t.string   "amazon_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "book_lists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amazon_url"
    t.string   "asin"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "friend_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     :null => false
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "invites", :force => true do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.string   "invitee_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "book_id"
    t.integer  "book_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "blurb"
  end

  add_index "line_items", ["book_id"], :name => "index_line_items_on_book_id"
  add_index "line_items", ["book_list_id", "book_id"], :name => "index_line_items_on_book_list_id_and_book_id", :unique => true
  add_index "line_items", ["book_list_id"], :name => "index_line_items_on_book_list_id"

  create_table "recommendation_requests", :force => true do |t|
    t.integer  "requestor_user_id"
    t.integer  "recommender_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",           :default => false
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "recommendation_request_id"
    t.integer  "recommender_user_id"
    t.integer  "requestor_user_id"
    t.integer  "book_id"
    t.string   "blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processed",                 :default => false
    t.string   "response"
    t.integer  "amazon_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
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
    t.string   "first"
    t.string   "last"
    t.boolean  "admin",                                 :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
