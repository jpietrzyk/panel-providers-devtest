module API
  module Public
    module V1
      class Locations < API::Public::V1::RootV1
        include API::Defaults
        resource :locations, desc: 'Public locations for a country' do
          desc 'Public locations for a country.'
          oauth2
          get '/:country_code' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
