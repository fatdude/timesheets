class Rate < ActiveRecord::Base
  # Relationships
  belongs_to :client
  
  class << self
    def types
      [['Hourly', false], ['Daily', true]]
    end
  end
end
