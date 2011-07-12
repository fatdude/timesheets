class Client < ActiveRecord::Base
  # Validations
  validates :name, :presence => true
  validates :code, :presence => true
  
  # Filters
  before_save :update_rates
  
  def to_s
    self.name
  end
  
  private
  
    def update_rates
      self.day_rate = 7.5 * self.rate if self.day_rate.blank? && !self.rate.blank?
      self.rate = self.day_rate / 7.5 if self.rate.blank? && !self.day_rate.blank?
    end
end
