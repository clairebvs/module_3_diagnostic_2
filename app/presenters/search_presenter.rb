class SearchPresenter
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations = service.stations.map do |station_data|
      Station.new(station_data)
    end
  end

  def service(zip_code)
    NrelService.new(zip_code)
  end
end
