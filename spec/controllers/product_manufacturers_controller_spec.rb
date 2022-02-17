# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductManufacturersController, type: :request do
  it 'GET #index' do
    get product_manufacturers_path
    expect(response.status).to eq(200)
  end

  it 'GET #show' do
    product_manufacturer = ProductManufacturer.create(name: 'Кальяны', description: 'Описание')

    get product_manufacturer_path(id: product_manufacturer.id)

    expect(response.status).to eq(200)
  end

  it 'POST #create' do
    params = { product_manufacturer: { name: 'Кальяны', description: 'Описание' } }

    expect(ProductManufacturer.count).to eq(0)

    post product_manufacturers_path(params)

    expect(response.status).to eq(302)
    expect(ProductManufacturer.count).to eq(1)
  end
end
