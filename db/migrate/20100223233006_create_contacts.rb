class CreateContacts < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
    drop_table :contacts
  end
end
