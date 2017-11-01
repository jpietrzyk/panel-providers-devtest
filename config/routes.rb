Rails.application.routes.draw do
  use_doorkeeper
  mount API::BasePrivate => '/api'
  mount API::BasePublic => '/api'

  resources :doc, only: [:index] do
    collection do
      get :api_v1
      get :o2c
      get :authorize
    end
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
