FactoryGirl.define do
  sequence :unique_name do |n|
    "some cool name#{n}"
  end

  sequence :unique_email do |n|
    "foo#{n}@bar.com"
  end

  sequence :unique_code do |n|
    "secret-#{n}"
  end

  sequence :external_id do |n|
    "#{n}-ext"
  end

  sequence(:country_code) { ('A'..'Z').to_a.sample(2).join }


  factory :user do
    email { generate(:unique_email) }
  end

  factory :doorkeeper_application, class: Doorkeeper::Application do
    name { generate(:unique_name) }
    redirect_uri 'https://app.com'
  end

  factory :doorkeeper_token, class: Doorkeeper::AccessToken do
    application_id { FactoryGirl.create(:doorkeeper_application).id }
    resource_owner_id { FactoryGirl.create(:user).id }
    scopes :private_access
  end

  factory :panel_provider do
    code { generate(:unique_code) }
  end

  factory :country do
    country_code { generate(:country_code) }
    panel_provider_id { FactoryGirl.create(:panel_provider).id }
  end

  factory :location do
    name { generate(:unique_name) }
    secret_code { generate(:unique_code) }
  end

  factory :location_group do
    name { generate(:unique_name) }
    country_id { FactoryGirl.create(:country).id }
    panel_provider_id { FactoryGirl.create(:panel_provider).id }
  end

  factory :target_group do
    name { generate(:unique_name) }
    external_id { generate(:external_id) }
    secret_code { generate(:unique_code) }
    panel_provider_id { FactoryGirl.create(:panel_provider).id }
  end
end
