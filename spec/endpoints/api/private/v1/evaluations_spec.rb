require 'rails_helper'

describe API::Private::V1::Evaluations, type: :request do
  include_context :oauth_app
  describe 'current' do
    it 'sends correct error code when no user present' do
      post '/api/private/v1/evaluations'
      expect(response.response_code).to eq(401)
      expect(response.body.match('OAuth')).to be_present
      expect(response.headers['Content-Type'].match('json')).to be_present
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'fails if no access token' do
      post '/api/private/v1/evaluations', format: :json
      expect(response.response_code).to eq(401)
      expect(JSON(response.body)['error'].present?).to be_truthy
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'evaluates locations list' do
      post '/api/private/v1/evaluations', format: :json, access_token: access_token.token
      result = JSON.parse(response.body)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.response_code).to eq(201)
      expect(response.body).to eq({ ping: 'pong' }.to_json)
    end
  end
end
