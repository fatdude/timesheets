class Activity < ActiveRecord::Base
  # Relationships
  belongs_to :invoice
  belongs_to :project
  has_one :client, :through => :project
  
  # Filters
  before_save :update_rate
  
  # Validations
  validates :project_id, :presence => true
  
  private
    
    def update_rate
      self.rate = self.client.rate if self.project_id_changed?
    end
end
