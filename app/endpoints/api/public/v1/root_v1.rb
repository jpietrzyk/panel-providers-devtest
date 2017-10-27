module API
  module Public
    module V1
      class RootV1 < API::Base
        format :json
        version 'v1'
        prefix 'public'
        default_error_formatter :json
        content_type :json, 'application/json'
        use ::WineBouncer::OAuth2

        rescue_from :all do |e|
          API::Base.respond_to_error(e)
        end

        mount API::Public::V1::Ping
        mount API::Public::V1::Locations
        mount API::Public::V1::TargetGroups
      end
    end
  end
end
