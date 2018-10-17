class SearchPresenter

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations = service.stations.map do |station_data|
      Station.new(station_data)
    end
  end

  private
  attr_reader :zip_code

  def service
    NrelService.new(zip_code)
  end
end
