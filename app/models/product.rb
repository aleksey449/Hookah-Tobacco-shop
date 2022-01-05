class ProductsController < ApplicationController

    load_resource
   
    # GET /products
    # GET /products.json
    def index
       @catalog = Product.product_manufacturer
    end
   
    # GET /products/1
    # GET /products/1.json
    def show
        #@page_slider = @product.slider
    end
    end
