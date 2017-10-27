Rails.application.routes.draw do
  use_doorkeeper
  mount API::Base => '/api'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
