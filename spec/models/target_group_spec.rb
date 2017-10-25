require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  it { should belong_to(:panel_provider) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:panel_provider) }
end
