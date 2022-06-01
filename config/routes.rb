Rails.application.routes.draw do
  devise_for :accounts
  resources :communities
  root "public#index"
end
