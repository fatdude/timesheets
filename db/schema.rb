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

ActiveRecord::Schema.define(:version => 20100306213206) do

  create_table "activities", :force => true do |t|
    t.integer  "client_id"
    t.decimal  "rate"
    t.text     "description"
    t.float    "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.date     "date"
    t.integer  "project_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rate"
    t.string   "code"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.boolean  "main"
    t.string   "phone"
    t.string   "mobile"
    t.string   "skype"
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.datetime "paid_at"
    t.datetime "sent_at"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total"
    t.float    "vat"
    t.float    "flat_rate"
    t.string   "code"
  end

  create_table "projects", :force => true do |t|
    t.integer  "client_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.float    "vat_percent"
    t.float    "vat"
    t.float    "flat_rate_percent"
    t.float    "flat_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
