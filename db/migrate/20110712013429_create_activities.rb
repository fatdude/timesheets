class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.decimal :rate
      t.text :description
      t.decimal :hours
      t.references :invoice
      t.date :date
      t.references :project

      t.timestamps
    end
    add_index :activities, :invoice_id
    add_index :activities, :project_id
  end
end
