Rails.application.routes.draw do

  root 'users#show'
  # root        GET    /                       user#show
  
  resources :sessions, only: [:new, :create, :destroy]
  # sessions    POST   /sessions(.:format)     sessions#create
  # new_session GET    /sessions/new(.:format) sessions#new
  # session     DELETE /sessions/:id(.:format) sessions#destroy
  
  resources :users, only: [:new, :create, :show]
  # users       POST   /users(.:format)        users#create
  # new_user    GET    /users/new(.:format)    users#new
  # user        GET    /users/:id(.:format)    users#show
  
  resources :accounts, only: [:new, :create, :show]
  # accounts    POST   /accounts(.:format)     accounts#create
  # new_account GET    /accounts/new(.:format) accounts#new
  # account     GET    /accounts/:id(.:format) accounts#show
  
end
