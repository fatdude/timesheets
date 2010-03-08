class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
