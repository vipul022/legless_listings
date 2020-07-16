Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: { sign_in: 'login'}
    get "/", to: "pages#home", as: "root"
    # any path that is not defined in the app
    resources :listings
    # get "*path", to:"pages#not_found"
    get "/payments/success", to: "payments#success"
    post "/payments/webhook", to: "payments#webhook"
end
