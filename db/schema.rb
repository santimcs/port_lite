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

ActiveRecord::Schema.define(version: 20220305061939) do

# Could not dump table "D2016-03-17" because of following StandardError
#   Unknown type '' for column 'id'

  create_table "consensus", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "buy"
    t.integer "hold"
    t.integer "sell"
    t.decimal "eps_a"
    t.decimal "eps_b"
    t.decimal "pe"
    t.decimal "pbv"
    t.decimal "yield"
    t.decimal "consensus_price"
    t.string "status"
    t.integer "stock_id"
    t.index ["name"], name: "index_consensus_on_name", unique: true
  end

  create_table "factsheets", force: :cascade do |t|
    t.string "name"
    t.integer "item_id"
    t.decimal "figure1", precision: 9, scale: 2
    t.decimal "figure2", precision: 9, scale: 2
    t.decimal "figure3", precision: 9, scale: 2
    t.decimal "figure4", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_factsheets_on_item_id"
  end

  create_table "filter_all", id: false, force: :cascade do |t|
    t.integer "index", limit: 8
    t.text "name"
    t.text "market_x"
    t.text "market_y"
    t.integer "id", limit: 8
    t.index ["index"], name: "ix_filter_all_index"
  end

  create_table "items", force: :cascade do |t|
    t.string "desc_en"
    t.string "desc_th"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "latest_dates", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "trade"
    t.string "name"
    t.integer "qty"
    t.decimal "price", precision: 6, scale: 2
    t.integer "active"
    t.string "reason"
    t.string "market"
    t.date "xdate", default: "2022-02-02"
  end

  create_table "profits", force: :cascade do |t|
    t.string "name"
    t.string "quarter"
    t.integer "latest_profit"
    t.integer "previous_profit"
    t.integer "inc_profit"
    t.decimal "inc_percent", precision: 6, scale: 2
    t.integer "year"
    t.index ["name", "year", "quarter"], name: "index_profits_on_name_and_year_and_quarter", unique: true
  end

  create_table "sales", force: :cascade do |t|
    t.string "name"
    t.date "fm_date"
    t.date "to_date"
    t.integer "days"
    t.decimal "fm_price", precision: 6, scale: 2
    t.decimal "to_price", precision: 6, scale: 2
    t.decimal "diff", precision: 5, scale: 2
    t.decimal "pct", precision: 5, scale: 2
    t.integer "ttl_spread"
    t.integer "avg_spread"
    t.decimal "max_price", precision: 6, scale: 2
    t.decimal "min_price", precision: 6, scale: 2
    t.bigint "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "latest_date_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.decimal "max_price", precision: 6, scale: 2
    t.decimal "min_price", precision: 6, scale: 2
    t.string "status", default: "O"
    t.decimal "buy_target", precision: 6, scale: 2
    t.decimal "sell_target", precision: 6, scale: 2
    t.decimal "volume", precision: 6, scale: 2
    t.decimal "beta", precision: 3, scale: 2
    t.decimal "cost", precision: 6, scale: 2
    t.integer "qty"
    t.integer "buy_spread"
    t.integer "sell_spread"
    t.integer "available_qty"
    t.integer "bl", default: 0
    t.integer "sh", default: 0
    t.string "reason"
    t.string "market"
  end

end
