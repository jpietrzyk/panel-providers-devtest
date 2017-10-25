class API < Grape::API
  prefix 'api'
  format :json
  mount Pbc::Ping
end