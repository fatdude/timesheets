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

ActiveRecord::Schema.define(:version => 20110713002331) do

  create_table "activities", :force => true do |t|
    t.decimal  "rate"
    t.text     "description"
    t.decimal  "hours"
    t.integer  "invoice_id"
    t.date     "date"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["invoice_id"], :name => "index_activities_on_invoice_id"
  add_index "activities", ["project_id"], :name => "index_activities_on_project_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.decimal  "rate"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "day_rate"
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

  add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.datetime "paid_at"
    t.datetime "sent_at"
    t.date     "from"
    t.date     "to"
    t.decimal  "total"
    t.float    "vat"
    t.float    "flat_rate"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["client_id"], :name => "index_invoices_on_client_id"

  create_table "projects", :force => true do |t|
    t.integer  "client_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["client_id"], :name => "index_projects_on_client_id"

  create_table "rates", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "value"
    t.integer  "client_id"
    t.boolean  "daily"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["client_id"], :name => "index_rates_on_client_id"

  create_table "settings", :force => true do |t|
    t.float    "vat"
    t.float    "flat_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
