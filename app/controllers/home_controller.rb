# frozen_string_literal: true

class HomeController < ApplicationController
    def index
        @product_manufacturers = ProductManufacturer.all
        @product_categories = ProductCategory.all
    end   

end
  