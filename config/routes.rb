Rails.application.routes.draw do
  get 'sessions/new'
  
  resources :post_histories
  resources :posts
  resources :boards
  resources :user_roles
  resources :user_statuses
  resources :channel_groups
  resources :user_groups
  resources :channels
  resources :groups
  resources :sessions
  resources :users do
    collection{post :import}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #setting homepage:
  #root to: "thing#otherthing"
  #         "callToController#callToMethod"
  root to: "channels#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
end