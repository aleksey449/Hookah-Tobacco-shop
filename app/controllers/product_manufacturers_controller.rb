class ProductManufacturersController < ApplicationController
    def index
        @product_manufacturers = ProductManufacturer.all
    end

    def new
        @product_manufacturer = ProductManufacturer.new
    end

    def show
        @product_manufacturer = ProductManufacturer.find(params[:id])
    end    

    def create
        @product_manufacturer = ProductManufacturer.new(product_manufacturer_params)
      
        if @product_manufacturer.save
          redirect_to @product_manufacturer
    else
      render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product_manufacturer = ProductManufacturer.find(params[:id])
    end
     
    def update
        @product_manufacturer = ProductManufacturer.find(params[:id])

        if @product_manufacturer.update(product_manufacturer_params)
            redirect_to @product_manufacturer
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        @product_manufacturer = ProductManufacturer.find(params[:id])
        @product_manufacturer.destroy
    
        redirect_to root_path
    end

    private
        def product_manufacturer_params
            params.require(:product_manufacturer).permit(:name, :description)
        end
end    