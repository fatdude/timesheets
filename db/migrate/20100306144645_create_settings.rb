class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.float :vat_percent
      t.float :vat
      t.float :flat_rate_percent
      t.float :flat_rate

      t.timestamps
    end

    Setting.create(:vat_percent => 17.5, :vat => 1.175, :flat_rate_percent => 12.0, :flat_rate => 1.12)
  end

  def self.down
    drop_table :settings
  end
end

