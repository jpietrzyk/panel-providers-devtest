module API
  module Public
    module V1
      class Root < API::BasePublic
        format :json
        version 'v1'
        prefix  'public'
        default_error_formatter :json
        content_type :json, 'application/json'
        use ::WineBouncer::OAuth2

        rescue_from :all do |e|
          API::BasePublic.respond_to_error(e)
        end

        mount API::Public::V1::Ping
        mount API::Public::V1::Locations
        mount API::Public::V1::TargetGroups

        mount API::Public::V1::Me

        add_swagger_documentation \
          base_path: '/api',
          api_version: 'v1',
          hide_format: true, # don't show .json
          hide_documentation_path: true,
          mount_path: '/swagger_doc',
          endpoint_auth_wrapper: WineBouncer::OAuth2,
          info: {
            title: 'Public Panel Provider API',
            description: 'Public API for developer test task. Description can be found at: https://github.com/pbc/devtest/blob/master/README.md'
          }

        route :any, '*path' do
          raise StandardError, 'Unable to find endpoint'
        end
      end
    end
  end
end
