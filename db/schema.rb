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

ActiveRecord::Schema.define(:version => 20121123035305) do

  create_table "associate_locations", :force => true do |t|
    t.integer  "associate_id"
    t.integer  "location_id"
    t.integer  "vnet"
    t.string   "seat_number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "associate_logins", :force => true do |t|
    t.integer  "associate_id"
    t.integer  "location_id"
    t.string   "login_ip"
    t.float    "login_latitude"
    t.float    "login_longitude"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "associates", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "pincode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geocoder_service"
    t.boolean  "user_defined"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
