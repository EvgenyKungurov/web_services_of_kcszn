Rails.application.routes.draw do
  resources :employment_centers
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post 'upload', to: 'employment_centers#upload'
  post 'find', to: 'employment_centers#find'
  get  'find', to: 'employment_centers#index'

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'dashboard#index'
  root 'dashboard#index'
end
