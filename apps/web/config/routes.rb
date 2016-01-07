resources :sessions, only: :new
get "/signup", to: "sessions#new"

redirect "/", to: "/signup"
