Rails.application.routes.draw do
  use_doorkeeper
  mount API::BasePrivate => '/api'
  mount API::BasePublic => '/api'

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
