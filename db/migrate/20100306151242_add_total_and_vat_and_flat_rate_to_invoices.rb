class AddTotalAndVatAndFlatRateToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :total, :decimal, :precision => 8, :scale => 2
    add_column :invoices, :vat, :float
    add_column :invoices, :flat_rate, :float
  end

  def self.down
    remove_column :invoices, :total
    remove_column :invoices, :vat
    remove_column :invoices, :flat_rate
  end
end

