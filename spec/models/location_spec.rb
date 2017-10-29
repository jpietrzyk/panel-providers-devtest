require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Associations' do
    it { should have_and_belong_to_many(:location_groups) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
