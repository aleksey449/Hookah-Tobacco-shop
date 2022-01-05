class ProductManufacturerController < ApplicationController
    def index
        @product_manufacturers = ProductManufacturer.all
    end

    def new
        @product_manufacturers = ProductManufacturer.new
    end

end

