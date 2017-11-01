module API
  module Private
    module V1
      class Root < API::BasePrivate
        format :json
        version 'v1'
        prefix 'private'
        default_error_formatter :json
        content_type :json, 'application/json'
        use ::WineBouncer::OAuth2

        rescue_from :all do |e|
          API::BasePrivate.respond_to_error(e)
        end

        mount API::Private::V1::Ping
        mount API::Private::V1::Locations
        mount API::Private::V1::TargetGroups
        mount API::Private::V1::Evaluations
      end
    end
  end
end
