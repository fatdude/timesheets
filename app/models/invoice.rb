class Invoice < ActiveRecord::Base
  default_scope includes(:activities)
  
  # Filters
  before_update :update_dates
  before_update :update_activities
  after_create :update_code
  after_save :link_activities
  before_create :set_vat_and_flat_rate

  # Relationships
  belongs_to :client
  has_many :activities, :dependent => :nullify

  # Named Scopes
  scope :unpaid, where(:paid_at => nil)
  scope :paid_status, lambda { |status|
    return {} if status == 'Any'
    if status == 'Yes'
      where("paid_at is not null")
    else
      where("paid_at is null")
    end
  }
  scope :sent_status, lambda { |status|
    return {} if status == 'Any'
    if status == 'Yes'
      where("sent_at is not null")
    else
      where("sent_at is null")
    end
  }
  scope :unsent, where(:sent_at => nil)
  scope :editable, where("sent_at is null or paid_at is null")
  scope :between, lambda { |from, to| from.blank? || to.blank? ? {} : where(["sent_at between ? and ?", from, to]) }
  scope :by_client, lambda { |id| id.blank? ? {} : where(:client_id => id) }

  attr_accessor :been_paid, :been_sent, :recalculate

  # Public Methods

  def to_param
    self.code.downcase
  end

  def paid?
    !self.paid_at.nil?
  end

  def sent?
    !self.sent_at.nil?
  end

  def vat_amount
    (self.total * self.vat) - self.total
  end

  def total_due
    self.total * self.vat
  end
  
  def total
    self.activities.all.sum(&:total)
  end

  private

  def update_activities
    if self.from_changed? || self.to_changed? || self.client_id_changed? || self.recalculate
      Activity.update_all({:invoice_id => nil}, {:invoice_id => self.id})
      link_activities
    end
  end

  def link_activities
    activities = Activity.uninvoiced.between(self.from, self.to).where(:client_id => self.client_id)
    Activity.update_all({:invoice_id => self.id}, ["id in (?)", activities.map(&:id)])
  end

  def update_code
    self.update_attribute :code, "GS#{self.client.code}#{"%04d" % self.id.to_i}"
  end

  def update_dates
    self.paid_at = Time.now if self.been_paid == '1'
    self.sent_at = Time.now if self.been_sent == '1'
  end

  def set_vat_and_flat_rate
    setting = Setting.first
    self.vat = setting.vat
    self.flat_rate = setting.flat_rate
  end

end

