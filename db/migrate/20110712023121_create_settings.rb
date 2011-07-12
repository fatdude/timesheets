class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.float :vat
      t.float :flat_rate

      t.timestamps
    end
  end
end
