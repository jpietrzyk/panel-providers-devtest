module API
  module Public
    module V1
      class TargetGroups < API::Public::V1::Root
        include API::Defaults
        resource :target_groups, desc: 'Public target groups for a country' do
          desc 'Public target groups for a country.'
          oauth2
          params do
            requires :country_code, type: String
          end
          get ':country_code' do
            target_groups = GetTargetGroupsService.new(
              country_code: params[:country_code]
            ).call
            present target_groups,
                    with: API::Entities::TargetGroup
          end
        end
      end
    end
  end
end
