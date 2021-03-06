require 'rails_helper'

RSpec.describe LocationGroup, type: :model do
  describe 'Associations' do
    it { should belong_to(:country) }
    it { should belong_to(:panel_provider) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:panel_provider) }
    it { should validate_presence_of(:name) }
  end
end
