require 'rails_helper'

RSpec.describe GetTargetGroupsService do
  describe '.call' do
    context 'when country not fount' do
      it 'returns empty result' do
        result = described_class.new(country_code: 'not-existed').call
        expect(result).to be_empty
      end
    end

    context 'when country found' do
      let(:target_group) { FactoryGirl.create(:target_group) }
      let(:country) do
        FactoryGirl.create(:country,
                           panel_provider: target_group.panel_provider)
      end
      it 'returns locations' do
        result = described_class.new(country_code: country.country_code).call
        expect(result).to_not be_empty
      end
    end
  end
end
