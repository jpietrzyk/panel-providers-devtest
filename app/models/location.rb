class Location < ActiveRecord::Base
  has_and_belongs_to_many :location_groups

  validates :name, presence: true
end
