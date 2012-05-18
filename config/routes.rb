Tumblrtv::Application.routes.draw do

  root :to => 'home#index'

  match '/auth/github/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

end
