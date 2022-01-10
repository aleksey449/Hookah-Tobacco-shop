# frozen_string_literal: true

Rails.application.routes.draw do
  get 'persons/profile'
  root 'home#index'

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'persons/profile', as: 'user_root'
end
