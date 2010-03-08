class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.references :client
      t.decimal :rate
      t.text :description
      t.datetime :started
      t.datetime :finished
      t.float :hours

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
