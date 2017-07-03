Rails.application.routes.draw do
  
  root 'sessions#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  # sessions    POST    /sessions(.:format)     sessions#create
  # new_session GET     /sessions/new(.:format) sessions#new
  # session     DELETE  /sessions/:id(.:format) sessions#destroy
  
  resources :users, only: [:new, :create]
  # users       POST   /users(.:format)        users#create
  # new_user    GET    /users/new(.:format)    users#new
  
end
