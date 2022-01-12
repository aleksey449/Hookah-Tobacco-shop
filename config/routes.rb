# frozen_string_literal: true

Rails.application.routes.draw do
  root 'product_categories#index'

  resources :product_categories
end
