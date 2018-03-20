Rails.application.routes.draw do
  resources :users

  resources :apidocs, only: [:index]
end
