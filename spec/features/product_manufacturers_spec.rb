# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductManufacturer do
  it '#index' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit root_path

    click_on 'Производители'

    expect(page).to have_content('ProductManufacturers')
    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_link('New ProductManufactur', href: new_product_manufacturer_path)
  end

  it '#show' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_manufacturer_path(product_manufacturer)

    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_content(product_manufacturer.description)
  end

  it '#destroy' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')
    visit product_manufacturer_path(product_manufacturer)
    click_on 'Destroy'
    expect(page).to have_current_path(product_manufacturers_path)
    expect(page).not_to have_content(product_manufacturer.name)
  end

  it '#update' do
    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit product_manufacturer_path(product_manufacturer)

    click_on 'Edit'
    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Update Product manufacturer'

    product_manufacturer.reload
    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_content(product_manufacturer.description)
  end

  it '#create' do
    visit product_manufacturers_path
    click_on 'New ProductManufactur'
    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Create Product manufacturer'
    expect(page).to have_content('Кальян')
    expect(page).to have_content('Из нержавеющей стали')
  end
end
