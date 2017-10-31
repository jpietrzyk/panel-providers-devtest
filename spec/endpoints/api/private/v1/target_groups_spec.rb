require 'rails_helper'

describe API::Private::V1::TargetGroups, type: :request do
  include_context :oauth_app
  context 'not authenticated user' do
    it 'sends correct error code when no user present' do
      get '/api/private/v1/target_groups/en'
      expect(response.response_code).to eq(401)
      expect(response.body.match('OAuth')).to be_present
      expect(response.headers['Content-Type'].match('json')).to be_present
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'fails if no access token' do
      get '/api/private/v1/target_groups/en', format: :json
      expect(response.response_code).to eq(401)
      expect(JSON(response.body)['error'].present?).to be_truthy
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end
  end

  context 'authenticated user' do
    include_context :target_groups
    it 'return target locations' do
      get "/api/private/v1/target_groups/#{country.country_code}",
          format: :json,
          access_token: access_token.token
      result = JSON.parse(response.body)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.response_code).to eq(200)
      expect(result.first['name']).to eq(target_group.name)
      expect(result.first['external_id']).to eq(target_group.external_id)
      expect(result.first['secret_code']).to eq(target_group.secret_code)
    end
  end
end
