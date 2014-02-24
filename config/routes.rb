EdwelPrograms::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'locations#index'
  
  resources :locations, only: [:index, :show], path: '' do
    resources :courses, only: [:show], path: '', as: :course
  end

  post 'mailchimp/subscribe' => 'mailchimp#subscribe'

end
