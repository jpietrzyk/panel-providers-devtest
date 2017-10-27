shared_context :oauth_app do
  let(:doorkeeper_application) { FactoryGirl.create(:doorkeeper_application) }
  let(:user) { FactoryGirl.create(:user) }
  let(:access_token) { FactoryGirl.create(:doorkeeper_token, application_id: doorkeeper_application.id, resource_owner_id: user.id) }
end

shared_context :oauth_public_app do
  let(:doorkeeper_application) { FactoryGirl.create(:doorkeeper_application) }
  let(:user) { FactoryGirl.create(:user) }
  let(:access_token) { FactoryGirl.create(:doorkeeper_token, application_id: doorkeeper_application.id, resource_owner_id: user.id) }
end