class NrelService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private

  attr_reader :zip

  def response
    conn.get("/api/alt-fuel-stations/v1/nearest.json", params)
  end

  def params
    {
      api_key: ENV["nrel_api_key"],
      location: zip_code,
      limit: 10,
      fuel_type: "ELEC,LPG",
      radius: "6.0"
    }
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
