# frozen_string_literal: true

Rails.application.routes.draw do
    root 'product_manufacturers#index'

    resources :product_manufacturers
end