require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  describe 'Associations' do
    it { should have_many(:countries) }
    it { should have_many(:location_groups) }
    it { should have_many(:target_groups) }
  end
end
