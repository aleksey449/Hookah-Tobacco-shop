# frozen_string_literal: true

module ActionDispatch
  module Routing
    class Mapper
      def draw(routes_name)
        instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
      end
    end
  end
end

Rails.application.routes.draw do
  root 'home#index'
  draw :admins
  devise_for :admins, path: 'admins', skip: [:registrations], controllers: { sessions: 'admins/sessions' }
  resources :product_categories, :product_manufacturers, :product_templates
end
