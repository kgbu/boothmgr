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

ActiveRecord::Schema.define(:version => 20100331210726) do

  create_table "attends", :force => true do |t|
    t.integer  "game_id"
    t.integer  "member_id"
    t.string   "prepok",       :default => "○"
    t.string   "prepsignok",   :default => "○"
    t.string   "signhelpok",   :default => "○"
    t.string   "settledownok", :default => "○"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zenzaok",      :default => "○"
    t.string   "kaigiok",      :default => "○"
    t.string   "extraok",      :default => "○"
  end

  create_table "entries", :force => true do |t|
    t.string   "member"
    t.string   "email"
    t.string   "prep"
    t.string   "prepsign"
    t.string   "signhelp"
    t.string   "settledown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.datetime "kickoff"
    t.string   "homeaway",     :default => "home"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "timeschedule", :default => "１．開門前準備（１０時１５分～）\n２．前座試合(１０時３０分～１２時、時間は目安)\n３．開門～サイン会整理券配布（１１時～１２時）\n４．サイン会列整理（７G)、旗貸出し(メイン)、１２時～１２時４０分）\n５．試合終了後片付け"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "passwordhash"
    t.string   "salt"
    t.boolean  "isadmin",      :default => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
