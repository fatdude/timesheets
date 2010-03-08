class ChangeInvoiceFromAndTo < ActiveRecord::Migration
  def self.up
    change_column :invoices, :from, :date
    change_column :invoices, :to, :date
  end

  def self.down
    change_column :invoices, :from, :datetime
    change_column :invoices, :to, :datetime
  end
end

