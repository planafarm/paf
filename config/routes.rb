Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :agents
  # devise_for :users
  root to: "home#index"
  resources :suppliers

  post 'data', to: 'data#hook'
end
