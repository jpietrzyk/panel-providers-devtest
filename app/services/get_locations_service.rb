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
    locations = Country.find_by(country_code: country_code)
                    .try(:panel_provider)
                    .try(:location_groups)
    locations || []
  end
end
