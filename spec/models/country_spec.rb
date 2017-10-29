require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Associations' do
    it { should belong_to(:panel_provider) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:panel_provider) }
    it { should validate_presence_of(:country_code) }
  end
end
