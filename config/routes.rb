Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "about-us" =>  "about#index", as: :about

  get "/" =>  "main#index", as: :root

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update", as: :update_password

  get "password/resets", to: "password_resets#new"
  post "password/resets", to: "password_resets#create"

  get "password/resets/edit", to: "password_resets#edit"
  patch "password/resets/edit", to: "password_resets#update" 

  delete "logout", to: "sessions#destroy"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
end
