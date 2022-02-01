# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategoriesController, type: :request do
  it 'GET #index' do
    get product_categories_path
    expect(response.status).to eq(200)
  end

  it 'GET #show' do
    product_category = ProductCategory.create(name: 'Кальяны', description: 'Описание')

    get product_category_path(id: product_category.id)

    expect(response.status).to eq(200)
  end

  it 'POST #create' do
    params = { product_category: { name: 'Кальяны', description: 'Описание' } }

    expect(ProductCategory.count).to eq(0)

    post product_categories_path(params)

    expect(response.status).to eq(302)
    expect(ProductCategory.count).to eq(1)
  end

  it 'GET #new' do
  end

  it 'DELETE #destroy' do
  end

  it 'PATCH #update' do
  end
end
