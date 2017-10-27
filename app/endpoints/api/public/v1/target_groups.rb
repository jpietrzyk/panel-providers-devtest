module API
  module Public
    module V1
      class TargetGroups < API::Public::V1::RootV1
        include API::Defaults
        resource :target_groups, desc: 'Public target groups for a country' do
          desc 'Public target groups for a country.'
          oauth2
          get '/:country_code' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
