EdwelPrograms::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'locations#index'
  
  resources :locations, only: [:index, :show], path: ''


end
