# frozen_string_literal: true

namespace :admins do
  get 'dashboard', to: 'dashboard#index'
  resources :product_categories, :product_manufacturers, :product_templates
end
