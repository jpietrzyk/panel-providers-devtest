module API
  module Private
    module V1
      class Locations < API::Private::V1::RootV1
        include API::Defaults
        resource :locations, desc: 'Private locations for a country' do
          desc 'Private locations for a country.'
          oauth2 'private_access'
          get '/:country_code' do
            {  }
          end
        end
      end
    end
  end
end
