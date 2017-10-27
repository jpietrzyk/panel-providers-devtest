module API
  module Public
    module V1
      class Ping < API::Public::V1::RootV1
        include API::Defaults
        resource :ping, desc: 'Just ping pongs' do
          desc 'Returns pong.'
          get '/' do
            { ping: 'pong' }
          end
        end
      end
    end
  end
end
