require 'rails_helper'

describe NrelService do
  zip_code = "80203"
  subject { NrelService.new(zip_code) }

  it "exists" do
    expect(subject).to be_an NrelService
  end

  context "instance methods" do
    context "#stations" do
      it "returns an array of hashes with station data" do
        data_stations = subject.stations
        data_station  = data_stations.first

        expect(data_stations.count).to eq 10
        expect(data_station).to have_key :station_name
        expect(data_station).to have_key :fuel_type_code
        expect(data_station).to have_key :distance
        expect(data_station).to have_key :access_days_time
        expect(data_station).to have_key :street_address
        expect(data_station).to have_key :city
        expect(data_station).to have_key :state
        expect(data_station).to have_key :zip
      end
    end
  end
end
