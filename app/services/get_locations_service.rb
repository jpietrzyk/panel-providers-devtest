class GetLocationsService
  class ServiceError < StandardError; end

  def initialize(country_code:, scope: :public)
    @country_code = country_code
    @scope = scope
  end

  def call
    locations
  end

  private

  attr_reader :country_code, :scope

  def locations
    location_groups = Country.find_by(country_code: country_code)
                    .try(:panel_provider)
                    .try(:location_groups)
    return [] if location_groups.blank?

    location_groups.map(&:locations).try(:flatten) || []
  end
end
