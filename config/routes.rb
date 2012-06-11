Tumblrtv::Application.routes.draw do

  root :to => 'home#index'
  get "home/index" , :as => "home"

  # Git hub oauth 
  match '/auth/github/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  # Login and logout 
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

  # For managing join_requests 
  match '/join/:id' => 'join_requests#create', :as => 'join_team'
  match '/accept/:id' => 'join_requests#accept', :as => 'accept'
  match '/decline/:id'=> 'join_requests#decline', :as => 'decline'

  # for managing add_requests
  match '/add/:id' => 'add_requests#create', :as => 'add_request'
  match '/accept_add/:id' => 'add_requests#accept', :as => 'accept_add'
  match '/decline_add/:id'=> 'add_requests#destroy', :as => 'decline_add'


  # User  leaves team
  match '/leave/:id'  => 'team_members#leave',  :as =>'leave_team'

  # REST methods
  resources :teams
  resources :users
  resources :team_members
  
end
