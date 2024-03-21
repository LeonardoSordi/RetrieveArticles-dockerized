Rails.application.routes.draw do
  resources :retrieved_articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "retrieved_articles/create_article" => "retrieved_articles#create_article", as: :create_article
  delete "retrieved_articles/delete_article", to: "retrieved_articles#delete_article", as: :delete_article

  root 'retrieved_articles#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
