require 'rails_helper'

RSpec.describe GetLocationsService do
  describe '.call' do
    context 'when country not fount' do
      it 'returns empty result' do
        result = described_class.new(country_code: 'not-existed').call
        expect(result).to be_empty
      end
    end

    context 'when country found' do
      let(:country) { FactoryGirl.create(:country) }
      let(:location_group) do
        FactoryGirl.create(
          :location_group,
          locations: [FactoryGirl.create(:location)],
          panel_provider: country.panel_provider,
          country: country
        )
      end

      it 'returns locations' do
        result = described_class.new(
          country_code: location_group.country.country_code
        )
                                .call
        expect(result).to_not be_empty
      end
    end
  end
end
