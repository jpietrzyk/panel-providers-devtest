module API
  module Private
    module V1
      class TargetGroups < API::Private::V1::RootV1
        include API::Defaults
        resource :target_groups, desc: 'Private target groups for a country' do
          desc 'Private target groups for a country.'
          oauth2 'private_access'
          get '/:country_code' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
