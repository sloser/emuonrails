# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080803115904) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "category_id",      :limit => 11
    t.string   "article_code"
    t.text     "lead"
    t.text     "content"
    t.string   "author"
    t.integer  "show_on_homepage", :limit => 1
    t.integer  "show_forever",     :limit => 1
    t.date     "from_date"
    t.date     "to_date"
    t.float    "disorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_images", :force => true do |t|
    t.integer  "article_id",   :limit => 11
    t.integer  "parent_id",    :limit => 11
    t.integer  "size",         :limit => 11
    t.integer  "width",        :limit => 11
    t.integer  "height",       :limit => 11
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_category_id", :limit => 11
    t.string   "category_code"
    t.integer  "language_id",        :limit => 11
    t.integer  "show_in_menu",       :limit => 1
    t.float    "disorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "article_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.boolean "show_comments"
    t.boolean "show_related_articles"
    t.boolean "show_categories_articles"
    t.boolean "use_tags"
    t.boolean "use_send_to_friend"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",        :limit => 11
    t.integer  "taggable_id",   :limit => 11
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tiny_mce_photos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id",      :limit => 11
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size",         :limit => 11
    t.integer  "parent_id",    :limit => 11
    t.string   "thumbnail"
    t.integer  "width",        :limit => 11
    t.integer  "height",       :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
