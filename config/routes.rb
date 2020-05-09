Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'welcome', to: 'pages#welcome', as: :welcome

  get 'parse', to: 'pages#email_parse', as: :email_parse
  post 'parse', to: 'pages#email_parse'
  post 'email_processor', to: 'griddler/emails#create'

  resources :organizations do
    resources :teams, only: [:show, :new, :edit, :create, :update] do
      resources :participations, only:[:new, :create, :destroy]
      resources :meetings, only:[:index,:show, :new, :edit, :create, :update] do
        resources :invitations, only:[:new, :create, :edit] do
          collection do
            get :invite_someone
            post :send_invites

          end
        end
      end
    end
  end
  resources :teams, only: [:destroy]
  resources :meetings, only: [:destroy]
  resources :invitations, only:[:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
