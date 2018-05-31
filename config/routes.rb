Rails.application.routes.draw do
  resources :landlords
  resources :tenants
  resources :properties
  resources :apartments
  post '/login', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  post '/find', to: 'auth#find'
  post '/message', to: 'auth#message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
