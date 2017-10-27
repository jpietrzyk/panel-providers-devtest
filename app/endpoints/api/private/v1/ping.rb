module API
  module Private
    module V1
      class Ping < API::Private::V1::RootV1
        include API::Defaults
        resource :ping, desc: 'Just ping pongs' do
          desc 'Returns pong.'
          oauth2 'private_access'
          get '/' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
