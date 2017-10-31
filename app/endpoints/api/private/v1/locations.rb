module API
  module Private
    module V1
      class Locations < API::Private::V1::RootV1
        include API::Defaults
        resource :locations, desc: 'Private locations for a country' do
          desc 'Private locations for a country.'
          oauth2 'private_access'
          params do
            requires :country_code, type: String
          end
          get ':country_code' do
            locations = GetLocationsService.new(
              country_code: params[:country_code],
              scope: :private
            ).call
            present locations,
                    with: API::Entities::Location,
                    scope: :private_access
          end
        end
      end
    end
  end
end
