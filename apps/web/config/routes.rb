resources :sessions, only: [:create, :new]
get "/signup", to: "sessions#new"
get "/auth/:provider/callback", to: "sessions#create"

redirect "/", to: "/signup"
