# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductTemplate do
  it '#index' do
    visit product_templates_path

    expect(page).to have_content('Manufacturers and categories')
  end

  it '#show' do
    product_category = ProductCategory.create(name: 'Кальян', description: 'Описание')
    product_manufacturer = ProductManufacturer.create(name: 'Dark Side', description: 'Описание')

    product_template = described_class.create(name: 'Табак', price: '500', description: 'Крепкий', product_category: product_category,
                                              product_manufacturer: product_manufacturer)

    visit product_template_path(product_template)

    expect(page).to have_content(product_template.name)
    expect(page).to have_content(product_template.price)
    expect(page).to have_content(product_template.description)
  end
end
