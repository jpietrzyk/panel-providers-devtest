module API
  module Private
    module V1
      class Evaluations < API::Private::V1::RootV1
        include API::Defaults
        resource :evaluations, desc: 'Target evaluation' do
          desc 'Target evaluation'
          oauth2 'private_access'
          post '/' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
