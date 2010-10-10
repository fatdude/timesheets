class ChangeHoursToBigdecimal < ActiveRecord::Migration
  def self.up
    change_column :activities, :hours, :decimal
  end

  def self.down
    change_column :activities, :hours, :float
  end
end
