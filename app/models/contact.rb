class Contact < ActiveRecord::Base
  # Relationships
  belongs_to :client

  # Validations
  validates_presence_of :name
end

