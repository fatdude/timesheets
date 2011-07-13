class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name
      t.text :description
      t.decimal :value
      t.references :client
      t.boolean :daily

      t.timestamps
    end
    add_index :rates, :client_id
  end
end
