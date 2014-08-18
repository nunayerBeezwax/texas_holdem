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

ActiveRecord::Schema.define(version: 20140810205238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.integer "table_id"
  end

  create_table "boards_cards", force: true do |t|
    t.integer "board_id"
    t.integer "card_id"
  end

  create_table "buttons", force: true do |t|
    t.integer "table_id"
    t.integer "on"
  end

  create_table "cards", force: true do |t|
    t.string  "suit"
    t.integer "rank"
    t.integer "index"
  end

  create_table "cards_players", force: true do |t|
    t.integer "card_id"
    t.integer "player_id"
  end

  create_table "cards_tables", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "table_id"
  end

  create_table "players", force: true do |t|
    t.string  "name"
    t.integer "chips"
  end

  create_table "players_tables", id: false, force: true do |t|
    t.integer "table_id"
    t.integer "player_id"
  end

  create_table "pots", force: true do |t|
    t.integer "table_id"
    t.integer "chips"
  end

  create_table "seats", force: true do |t|
    t.integer "table_id"
    t.integer "number"
    t.integer "player_id"
  end

  create_table "tables", force: true do |t|
  end

end
