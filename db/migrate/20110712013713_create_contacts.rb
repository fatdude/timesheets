class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.boolean :main
      t.string :phone
      t.string :mobile
      t.string :skype
      t.string :email
      t.references :client

      t.timestamps
    end
    add_index :contacts, :client_id
  end
end
