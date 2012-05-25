Tumblrtv::Application.routes.draw do

  root :to => 'home#index'
  get "home/index" , :as => "home"

  match '/auth/github/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  
  match '/update/user' => 'home#update_user', :as => 'update_user'

  match '/accept/:token' => 'home#accept_team', :as => 'accept_team'
  match '/decline/:token' => 'home#decline_team', :as => 'decline_team'

  match '/join/:id' => 'teams#join', :as => 'join_team'

  resources :teams

end
