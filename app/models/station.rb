class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(station_data)
    @name = station_data[:station_name]
    @address = station_data[:street_address]
    @fuel_types = station_data[:fuel_type_code]
    @distance = station_data[:distance]
    @access_times = station_data[:access_days_time]
  end

  def self.stations_data(zip_code = "80203")
    nrel_service = NrelService.new('80203')
    @stations = nrel_service.stations.map do |station_data|
      Station.new(station_data)
    end
  end

end
