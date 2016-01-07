resources :teams, only: :new
get "/signup", to: "teams#new"

redirect "/", to: "/signup"
