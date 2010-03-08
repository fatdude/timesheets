class Client < ActiveRecord::Base
  # Relationships
  has_many :contacts, :dependent => :destroy
  has_many :activities, :order => "created_at desc"
  has_many :invoices
  has_many :projects

  # Validations
  validates_presence_of :name, :rate
  validates_numericality_of :rate

  def to_param
    "#{id}-#{name.parameterize}"
  end
end

