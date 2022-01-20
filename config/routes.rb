# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :product_categories
  resources :product_manufacturers
  resources :product_templates
end
