# frozen_string_literal: true

module Admins
  class ProductTemplatesController < Admins::ApplicationController
    def index
      @product_templates = ProductTemplate.all
    end

    def new
      @product_template = ProductTemplate.new
    end

    def create
      # @product_template = current_user.product_templates.build(product_template_params)
      @product_template = ProductTemplate.new(product_template_params)

      if @product_template.save
        redirect_to @product_template
      else
        render :new
      end
    end

    def show
      @product_template = ProductTemplate.find(params[:id])
      # @order_product = current_order.order_product.new
    end

    def edit
      @product_template = ProductTemplate.find(params[:id])
    end

    def update
      @product_template = ProductTemplate.find(params[:id])
      if @product_template.update(product_template_params)
        redirect_to @product_template
      else
        render :new
      end
    end

    def destroy
      @product_template = ProductTemplate.find(params[:id])
      @product_template.destroy

      redirect_to root_path
    end

    private

    def product_template_params
      params.require(:product_template).permit(:name, :description, :price, :product_manufacturer_id, :product_category_id)
    end
  end
end
