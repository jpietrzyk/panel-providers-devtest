require 'rails_helper'

describe API::Entities::Location do
  describe 'exposiures' do
    it 'expose id' do
      expect(described_class.find_exposure(:name)).to_not be_nil
    end

    it 'expose username' do
      expect(described_class.find_exposure(:external_id)).to_not be_nil
    end

    it 'expose email' do
      expect(described_class.find_exposure(:secret_code)).to_not be_nil
    end
  end
end
