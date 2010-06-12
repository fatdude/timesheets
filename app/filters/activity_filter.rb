class ActivityFilter < Filter
  # Accessors
  attr_accessor :client_id, :date_from, :date_to, :id

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
  end
end

