Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'welcome', to: 'pages#welcome', as: :welcome

  resources :organizations, only: [:index, :show, :new, :create, :edit, :update]
  resources :teams, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'new_team', to: 'organizations#new_team', as: :new_team
  # post 'create_team', to: 'organizations#create_team', as: :create_team


end
