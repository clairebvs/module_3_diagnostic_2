require 'rails_helper'

describe SearchPresenter do
  subject { SearchPresenter.new("80203") }

  it 'exists' do
    expect(subject).to be_a(SearchPresenter)
  end

  context 'instance methods' do
    context '#stations' do
      it 'returns all stations' do
        expect(subject.stations.count).to eq(10)
        expect(subject.stations.first).to be_a(Station)
      end
    end
  end
end
