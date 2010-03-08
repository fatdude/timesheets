class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.references :client
      t.datetime :paid_at
      t.datetime :sent_at
      t.datetime :from
      t.datetime :to
      t.string :title

      t.timestamps
    end

    add_column :clients, :code, :string
    add_column :activities, :invoice_id, :integer
  end

  def self.down
    drop_table :invoices
    remove_column :clients, :code
    remove_column :activities, :invoice_id
  end
end

