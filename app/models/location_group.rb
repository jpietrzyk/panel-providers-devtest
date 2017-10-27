class LocationGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
  has_and_belongs_to_many :locations

  validates :country, :panel_provider, :name, presence: true
end