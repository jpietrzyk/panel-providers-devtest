# frozen_string_literal: true

WineBouncer.configure do |config|
  config.auth_strategy = :swagger

  config.define_resource_owner do
    if doorkeeper_access_token
      User.find(doorkeeper_access_token.resource_owner_id)
    end
  end
end
