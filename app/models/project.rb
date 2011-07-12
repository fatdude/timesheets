class Project < ActiveRecord::Base
  # Relationships
  belongs_to :client
  
  # Validations
  validates :title, :presence => true
end
