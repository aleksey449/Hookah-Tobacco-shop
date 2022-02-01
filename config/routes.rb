# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :product_categories, :product_manufacturers, :product_templates
end
