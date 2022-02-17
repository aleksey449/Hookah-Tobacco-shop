# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductManufacturer do
  it '#index' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit root_path

    click_on 'Производители'

    expect(page).to have_content('Product Manufacturers')
    expect(page).to have_content(product_manufacturer.name)
    expect(page).not_to have_link('New Product Manufacturer', href: new_product_manufacturer_path)
  end

  it '#show' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_manufacturer_path(product_manufacturer)

    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_content(product_manufacturer.description)
  end
end
