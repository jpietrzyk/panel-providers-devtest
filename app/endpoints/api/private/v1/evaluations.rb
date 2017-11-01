module API
  module Private
    module V1
      class Evaluations < API::Private::V1::Root
        include API::Defaults
        resource :evaluations, desc: 'Target evaluation' do
          desc 'Target evaluation'
          oauth2 'private_access'
          params do
            requires :country_code, type: String
            requires :target_group_id, type: Integer
            requires :locations, type: Array
          end
          post '/' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
