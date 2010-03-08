class DeleteStartedFinisedFromActivities < ActiveRecord::Migration
  def self.up
    remove_column :activities, :started
    remove_column :activities, :finished
    add_column :activities, :date, :date
  end

  def self.down
    add_column :activities, :started, :datetime
    add_column :activities, :finished, :datetime
    remove_column :activities, :date
  end
end

