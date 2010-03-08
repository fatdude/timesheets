class AddRateToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :rate, :decimal
  end

  def self.down
    remove_table :clients, :rate
  end
end

