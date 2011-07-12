class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.float :vat_percent
      t.float :vat
      t.float :flat_rate_percent
      t.float :flat_rate

      t.timestamps
    end
  end
end
