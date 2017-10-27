module API
  module V1
    class RootV1 < API::Base
      format :json
      version 'v1'
      default_error_formatter :json
      content_type :json, 'application/json'
      use ::WineBouncer::OAuth2

      rescue_from :all do |e|
        API::Base.respond_to_error(e)
      end

      mount API::V1::Ping
    end
  end
end
