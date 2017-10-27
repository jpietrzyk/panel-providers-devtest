require 'rails_helper'

describe API::Private::V1::Ping, type: :request do
  describe 'current' do
    it 'ping' do
      get '/api/public/v1/ping'
      expect(response.body).to eq({ ping: 'pong' }.to_json)
    end
  end
end
