class EvaluateTargetService
  class ServiceError < StandardError; end

  def initialize(country_code:, target_group_id:, locations: {})
    @country_code = country_code
    @target_group_id = target_group_id
    @locations = locations
  end

  def call
    evaluate
  end

  private

  attr_reader :country_code, :target_group_id, :locations

  def evaluate
    target_groups = Country.find_by(country_code: country_code)
                           .try(:panel_provider)
                           .try(:target_groups)
    target_groups || []
  end
end
