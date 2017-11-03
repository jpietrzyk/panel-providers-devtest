require 'spec_helper'

describe API::Public::V1::Me, type: :request do
  include_context :oauth_app
  describe 'current' do
    it 'Sends correct error code when no user present' do
      get '/api/public/v1/me'
      expect(response.response_code).to eq(401)
      expect(response.body.match('OAuth')).to be_present
      expect(response.headers['Content-Type'].match('json')).to be_present
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'fails if no access token' do
      get '/api/public/v1/me', format: :json
      expect(response.response_code).to eq(401)
      expect(JSON(response.body)['error'].present?).to be_truthy
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'responds with the user' do
      get '/api/public/v1/me', format: :json, access_token: access_token.token
      result = JSON.parse(response.body)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(result['user']['email']).to eq(user.email)
      expect(response.response_code).to eq(200)
    end
  end

  describe 'update current user' do
    let(:attribs) { { email: 'foo@bar.com', access_token: access_token.token } }

    context 'incorrectly scoped access token' do
      it "fails if the access token doesn't have the required scope" do
        access_token.update_attribute :scopes, 'read_user'
        put '/api/public/v1/me', attribs, format: :json
        expect(response.response_code).to eq(403)
        expect(response.body.match(/OAuth error.* write to user/i))
          .to be_present
        user.reload
      end
    end
    context 'scoped access token' do
      before do
        access_token.update_attribute :scopes, 'write_user'
      end
      it 'updates the user' do
        put '/api/public/v1/me', attribs, format: :json
        expect(response.response_code).to eq(200)
        user.reload
        expect(user.email).to eq('foo@bar.com')
      end
    end
  end
end
