class Activity < ActiveRecord::Base
  before_create :set_rate
  before_save :set_hours
  after_destroy :update_invoice

  # Relationships
  belongs_to :client
  belongs_to :invoice
  belongs_to :project

  # Validations
  validates_numericality_of :hours, :greater_than => 0, :message => "needs to be specified as a number"
  validates_presence_of :description

  # Named Scopes
  scope :by_client, lambda { |id| id.blank? ? {} : where(:client_id => id) }
  scope :uninvoiced, where(:invoice_id => nil)
  scope :between, lambda { |from, to| from.blank? || to.blank? ? {} : where(["date between ? and ?", from, to]) }
  scope :unsent, joins(:invoice).where("activities.invoice_id is null or invoices.sent_at is null")

  # Public Methods

  def total
    return 0.0 unless self.rate && self.hours
    self.rate * self.hours
  end

  def invoiced?
    !self.invoice_id.nil?
  end

  def sent?
    return false unless self.invoiced?
    self.invoice.sent?
  end

  private

  def set_hours
    if self.hours.blank?
      self.hours = ((self.finished - self.started)/60/60).round(2)
    end
  end

  def set_rate
    self.rate = self.client.rate
  end

  def update_invoice
    return if self.invoice_id.nil?
    self.invoice.update_attribute(:recalculate, true)
  end
end

