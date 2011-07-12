class Project < ActiveRecord::Base
  # Relationships
  belongs_to :client
  
  # Validations
  validates :title, :presence => true
  
  def to_s
    self.title
  end
end
