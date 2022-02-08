# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategory do
  it '#index' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit root_path

    click_on 'Категории'

    expect(page).to have_content('ProductCategories')
    expect(page).to have_content(product_category.name)
    expect(page).to have_link('New ProductCategory', href: new_product_category_path)
  end

  it '#show' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_category_path(product_category)

    expect(page).to have_content(product_category.name)
    expect(page).to have_content(product_category.description)
  end

  it '#destroy' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_category_path(product_category)
    click_on 'Destroy'

    expect(page).to have_current_path(product_categories_path)
    expect(page).not_to have_content(product_category.name)
    expect(page).not_to have_content(product_category.description)
  end

  it '#update' do
    product_category = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_category_path(product_category)

    click_on 'Edit'
    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Update Product category'

    product_category.reload
    expect(page).to have_content(product_category.name)
    expect(page).to have_content(product_category.description)
  end

  it '#create' do
    visit product_categories_path
    click_on 'New ProductCategory'
    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Create Product category'
    expect(page).to have_content('Кальян')
    expect(page).to have_content('Из нержавеющей стали')
  end
end
