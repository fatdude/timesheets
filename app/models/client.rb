class Client < ActiveRecord::Base
  # Validations
  validates :name, :presence => true
  validates :code, :presence => true
  validates :rate, :presence => true, :numericality => true
end
