# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategory do
  it '#index' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit root_path

    click_on 'Категории'

    expect(page).to have_content('Product Categories')
    expect(page).to have_content(product_category.name)
    expect(page).not_to have_link('New Product Category', href: new_product_category_path)
  end

  it '#show' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_category_path(product_category)

    expect(page).to have_content(product_category.name)
    expect(page).to have_content(product_category.description)
  end
end
