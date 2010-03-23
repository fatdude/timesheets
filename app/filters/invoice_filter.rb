class InvoiceFilter
  # Accessors
  attr_accessor :client_id, :date_from, :date_to, :sent, :paid, :id

  # Methods
  def initialize(data={})
    @client_id = data.nil? ? nil : data[:client_id].blank? ? nil : data[:client_id].to_i
    begin
      @date_from = data.nil? ? nil : DateTime::civil(data['date_from(1i)'].to_i, data['date_from(2i)'].to_i, data['date_from(3i)'].to_i)
    rescue
      @date_from = nil
    end
    begin
      @date_to = data.nil? ? nil : DateTime::civil(data['date_to(1i)'].to_i, data['date_to(2i)'].to_i, data['date_to(3i)'].to_i) + 1439.minutes
    rescue
      @date_to = nil
    end
    @sent = data.nil? ? 'Any' : data[:sent]
    @paid = data.nil? ? 'Any' : data[:paid]
  end

  def self.model_name
    InvoiceFilter
  end

  def self.plural
    'invoice_filters'
  end

  def self.singular
    'invoice_filter'
  end
end

