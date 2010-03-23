class Project < ActiveRecord::Base
  # Relationships
  belongs_to :client

  # Validations
  validates_presence_of :title
  validates_uniqueness_of :title
end

