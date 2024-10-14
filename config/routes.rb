Rails.application.routes.draw do
  devise_for :users, skip: [ :registrations ]

  namespace :admin do
    get 'dashboard/home'
    root to: 'dashboard#home'
    resources :posts
    get 'pending', to: 'post#pending'
    resources :categories
    resources :tags
    get 'settings', to: 'user#settings'
  end

  resources :posts, only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
