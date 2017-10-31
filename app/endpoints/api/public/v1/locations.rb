module API
  module Public
    module V1
      class Locations < API::Public::V1::RootV1
        include API::Defaults
        resource :locations, desc: 'Public locations for a country' do
          desc 'Public locations for a country.'
          oauth2
          params do
            requires :country_code, type: String
          end
          get ':country_code' do
            locations = GetLocationsService.new(
              country_code: params[:country_code]
            ).call
            present locations, with: API::Entities::Location
          end
        end
      end
    end
  end
end
