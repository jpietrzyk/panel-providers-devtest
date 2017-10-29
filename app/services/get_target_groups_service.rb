class GetTargetGroupsService
  class ServiceError < StandardError; end

  def initialize(country_code:, scope: :public)
    @country_code = country_code
    @scope = scope
  end

  def call
    target_groups
  end

  private

  attr_reader :country_code, :scope

  def target_groups
    target_groups = Country.find_by(country_code: country_code)
                           .try(:panel_provider)
                           .try(:target_groups)
    target_groups || []
  end
end
