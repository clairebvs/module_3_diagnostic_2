require 'rails_helper'

describe SearchPresenter do
  subject { SearchPresenter.new }

  it 'exists' do
    expect(subject).to be_a(SearchPresenter)
  end

  context 'instance methods' do
    context '#stations_data' do
      it 'returns all stations' do
        expect(subject.stations_data.count).to eq(10)
        expect(subject.stations_data.first).to be_a(Station)
      end
    end
  end
end
