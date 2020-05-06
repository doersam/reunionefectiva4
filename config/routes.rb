Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'welcome', to: 'pages#welcome', as: :welcome

  resources :organizations do
    resources :teams, only: [:show, :new, :edit, :create, :update] do
      resources :participations, only:[:new, :create, :destroy]
      resources :meetings, only:[:index,:show, :new, :edit, :create, :update] do
        resources :invitations, only:[:new, :create, :edit]
      end
    end
  end
  resources :teams, only: [:destroy]
  resources :meetings, only: [:destroy]
  resources :invitations, only:[:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
