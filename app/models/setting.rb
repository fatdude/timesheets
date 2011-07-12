class Setting < ActiveRecord::Base
  attr_accessor :vat_percent, :flat_rate_percent
  
  # Filters
  before_validation :update_percentages
  
  def vat_percent
    (vat * 100.0) - 100
  end
  
  def flat_rate_percent
    (flat_rate * 100.0) - 100
  end
  
  private 
    
    def update_percentages
      self.vat = 1 + (@vat_percent.to_f / 100.0)
      self.flat_rate = 1 + (@flat_rate_percent.to_f / 100.0)
    end
end
