Rails.application.routes.draw do
  get 'leads', to: 'leads#index'
  get 'leads/:id', to: 'leads#show', as: 'lead'
  post 'leads', to: 'leads#store'
  delete 'leads/:id', to: 'leads#delete'
  patch 'leads/:id', to: 'leads#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
