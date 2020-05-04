Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'welcome', to: 'pages#welcome', as: :welcome

  resources :organizations do
    resources :teams, only: [:show, :new, :edit, :create, :update]
  end
  resources :teams, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'new_team', to: 'organizations#new_team', as: :new_team
  # post 'create_team', to: 'organizations#create_team', as: :create_team
  get 'new_participation', to: 'teams#new_participation', as: :new_participation
  post 'create_participation', to: 'teams#create_participation', as: :create_participation

end
