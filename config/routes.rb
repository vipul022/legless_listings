Rails.application.routes.draw do
    get "/", to: "pages#home", as: "root"
    # any path that is not defined in the app
    resources :listings
    # get "*path", to:"pages#not_found"
end
