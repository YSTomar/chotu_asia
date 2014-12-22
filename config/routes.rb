Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => "user_sessions#new", :as => :login
  delete 'logout' => "user_sessions#destroy", :as => :logout
  resources :users, except: [:index, :destroy]
  resource :user, :as => 'account' 

  get 'signup' => 'users#new', :as => :signup

  root :to => 'users#show'

end
