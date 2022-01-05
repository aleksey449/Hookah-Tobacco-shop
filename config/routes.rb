Rails.application.routes.draw do
    resources :product_manufacturers

    get '/product_manufacturers', to: 'product_manufacturers#index'

    get '/product_manufacturers/new', to: 'product_manufacturers#new'

    root 'pages#index'
end