class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :postcode
      t.decimal :rate
      t.string :code

      t.timestamps
    end
  end
end
