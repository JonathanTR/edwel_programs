EdwelPrograms::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :locations, only: [:index, :show]

  root to: 'locations#index'

end
