class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :client
      t.datetime :paid_at
      t.datetime :sent_at
      t.date :from
      t.date :to
      t.decimal :total
      t.float :vat
      t.float :flat_rate
      t.string :code

      t.timestamps
    end
    add_index :invoices, :client_id
  end
end
