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

ActiveRecord::Schema.define(version: 20140508155236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: true do |t|
    t.string   "condition"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "emergency"
  end

  add_index "conditions", ["user_id"], name: "index_conditions_on_user_id", using: :btree

  create_table "emergencycontacts", force: true do |t|
    t.string   "belongs_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "relationship"
    t.string   "contactnr"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.integer  "user_id"
  end

  add_index "emergencycontacts", ["user_id"], name: "index_emergencycontacts_on_user_id", using: :btree

  create_table "gpdetails", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "faxnumber"
    t.string   "contactnr"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.integer  "user_id"
  end

  add_index "gpdetails", ["user_id"], name: "index_gpdetails_on_user_id", using: :btree

  create_table "idverifies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", force: true do |t|
    t.string   "medication"
    t.text     "dose"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "emergency"
  end

  add_index "medications", ["user_id"], name: "index_medications_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.string   "contactnr"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "registrations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
