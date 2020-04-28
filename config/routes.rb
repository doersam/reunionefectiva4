Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/organizations', to: 'organizations#index', as: 'organizations'
  get '/organizations/new', to: 'organizations#new', as:'new_organization'
  get '/organizations/:id', to: 'organizations#show', as: 'organization'
  post '/organizations', to: 'organizations#create'
  get '/organizations/:id/edit', to:'organizations#edit'
  patch '/organizations/:id', to: 'organization#update'
  delete '/organizations/:id', to: 'organization#destroy'
  # resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
