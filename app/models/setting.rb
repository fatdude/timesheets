class Setting < ActiveRecord::Base
  before_save :update_values

  # Validations
  validates_numericality_of :vat_percent, :greater_than => 0
  validates_numericality_of :flat_rate_percent, :greater_than => 0

  private

  def update_values
    self.vat = 1.0 + (self.vat_percent/100)
    self.flat_rate = 1.0 + (self.flat_rate_percent/100)
  end
end

