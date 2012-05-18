Tumblrtv::Application.routes.draw do

  root :to => 'home#index'

  match '/auth/github/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  
  match '/update/user' => 'home#update_user', :as => 'update_user'
end
