class ChangeInvoiceTitleToCode < ActiveRecord::Migration
  def self.up
    add_column :invoices, :code, :string

    Invoice.all.each do |invoice|
      invoice.update_attribute :code, invoice.title
    end

    remove_column :invoices, :title
  end

  def self.down
    add_column :invoices, :title, :string

    Invoice.all.each do |invoice|
      invoice.update_attribute :title, invoice.code
    end

    remove_column :invoices, :code
  end
end

