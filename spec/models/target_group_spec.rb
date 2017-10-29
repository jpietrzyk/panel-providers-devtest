require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  describe 'Associations' do
    it { should belong_to(:panel_provider) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:panel_provider) }
  end
end
