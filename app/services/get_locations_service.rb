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
    country = Country.find_by(country_code: country_code)
    LocationGroup.where(country: country)
                 .order(:panel_provider_id)
                 .map(&:locations)
  end
end
