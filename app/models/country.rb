class Country < ActiveRecord::Base
  belongs_to :panel_provider

  validates :panel_provider, :country_code, presence: true
end
