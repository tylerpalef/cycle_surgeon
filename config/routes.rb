Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'

  delete 'logout' => 'user_sessions#destroy', :as => :logout

  get 'login' => 'user_sessions#new', :as => :login

  get 'index' => 'tickets#index', :as => :index

  get 'about' => 'about#index', :as => :about

  delete 'delete' => 'tickets#destroy', :as => :delete

  # delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions, only: [:create, :destroy]

  resources :users, except: [:delete]

  resources :tickets
    resources :accepted

  resource :about, only: [:about]


end
