module API
  module Private
    module V1
      class TargetGroups < API::Private::V1::Root
        include API::Defaults
        resource :target_groups, desc: 'Private target groups for a country' do
          desc 'Private target groups for a country.'
          oauth2 'private_access'
          params do
            requires :country_code, type: String
          end
          get ':country_code' do
            target_groups = GetTargetGroupsService.new(
              country_code: params[:country_code],
              scope: :private
            ).call
            present target_groups,
                    with: API::Entities::TargetGroup,
                    scope: :private_access
          end
        end
      end
    end
  end
end
