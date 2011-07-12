class AddDayRateToClients < ActiveRecord::Migration
  def change
    add_column :clients, :day_rate, :decimal
  end
end
