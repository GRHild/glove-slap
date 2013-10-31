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

ActiveRecord::Schema.define(version: 20131027022942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slaps", force: true do |t|
    t.integer  "challenger_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",        default: "pending"
  end

  add_index "slaps", ["challenger_id"], name: "index_slaps_on_challenger_id", using: :btree
  add_index "slaps", ["target_id"], name: "index_slaps_on_target_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "phone_id"
    t.string   "location"
    t.string   "nickname"
<<<<<<< Updated upstream
    t.string   "rank"
    t.text     "avatar_url"
=======
>>>>>>> Stashed changes
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
