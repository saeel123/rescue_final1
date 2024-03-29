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

ActiveRecord::Schema.define(version: 20151020095845) do

  create_table "complaints", force: :cascade do |t|
    t.string   "species",                    limit: 255
    t.boolean  "status",                                 default: false
    t.string   "city_name",                  limit: 255
    t.float    "latitude",                   limit: 24
    t.float    "longitude",                  limit: 24
    t.integer  "user_id",                    limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "species_image_file_name",    limit: 255
    t.string   "species_image_content_type", limit: 255
    t.integer  "species_image_file_size",    limit: 4
    t.datetime "species_image_updated_at"
    t.integer  "rescuer_id",                 limit: 4
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "city_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "res", force: :cascade do |t|
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rescue_complaints", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "complaint_id", limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rescuecompts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "complaint_id", limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255,              null: false
    t.string   "phno",                   limit: 255, default: "", null: false
    t.string   "role",                   limit: 255,              null: false
    t.string   "specialized",            limit: 255, default: "", null: false
    t.string   "reference_code",         limit: 255, default: "", null: false
    t.string   "referred_by",            limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
