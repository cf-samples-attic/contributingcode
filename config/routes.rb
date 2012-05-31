Tumblrtv::Application.routes.draw do

  root :to => 'home#index'
  get "home/index" , :as => "home"

  match '/auth/github/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  
  match '/update/user' => 'home#update_user', :as => 'update_user'

  match '/accept/:id' => 'teams#accept', :as => 'accept'
  match '/decline/:id'=> 'teams#decline', :as => 'decline'
  match '/leave/:id'  => 'teams#leave',  :as =>'leave_team'
  match '/remove/:id'  =>'teams#remove_member',   :as => 'remove_member'

  match '/join/:id' => 'teams#join', :as => 'join_team'

  resources :teams

end
