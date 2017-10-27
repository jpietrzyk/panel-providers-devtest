module API
  module V1
    class Ping < API::V1::RootV1
      include API::V1::Defaults
      resource :ping, desc: 'Just ping pongs' do
        desc 'Returns pong.'
        oauth2
        get '/' do
          { ping: 'pong' }
        end
      end
    end
  end
end
