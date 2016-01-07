get "/bots/ready", to: "bots#ready", as: :bots_ready

resources :sessions, only: [:create, :new]
get "/signup", to: "sessions#new", as: :signup
get "/auth/:provider/callback", to: "sessions#create"

redirect "/", to: "/signup"
