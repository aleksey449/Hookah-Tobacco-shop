# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductTemplate do
  it 'product_templates#index' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    visit admins_product_templates_path

    expect(page).to have_content('Manufacturers and categories')
  end

  it 'product_templates#show' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_category = ProductCategory.create(name: 'Кальян', description: 'Описание')
    product_manufacturer = ProductManufacturer.create(name: 'Dark Side', description: 'Описание')

    product_template = described_class.create(name: 'Табак', price: '500', description: 'Крепкий', product_category: product_category,
                                              product_manufacturer: product_manufacturer)

    visit admins_product_template_path(product_template)

    expect(page).to have_content(product_template.name)
    expect(page).to have_content(product_template.price)
    expect(page).to have_content(product_template.description)
  end

  it '#destroy' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_category = ProductCategory.create(name: 'Кальян', description: 'Описание')
    product_manufacturer = ProductManufacturer.create(name: 'Dark Side', description: 'Описание')

    product_template = described_class.create(name: 'Табак', price: '500', description: 'Крепкий', product_category: product_category,
                                              product_manufacturer: product_manufacturer)

    visit admins_product_template_path(product_template)

    click_on 'Destroy'
    expect(page).not_to have_content(product_template.name)
  end

  it '#update' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_category = ProductCategory.create(name: 'Кальян', description: 'Описание')
    product_manufacturer = ProductManufacturer.create(name: 'Dark Side', description: 'Описание')

    product_template = described_class.create(name: 'Табак', price: '500', description: 'Крепкий', product_category: product_category,
                                              product_manufacturer: product_manufacturer)
    visit admins_product_template_path(product_template)

    click_on 'Edit'

    fill_in 'Name', with: 'Кальян'
    fill_in 'Price', with: '500'
    fill_in 'Description', with: 'Описание'
    select('Кальян', from: 'product_template[product_category_id]')
    select('Dark Side', from: 'product_template[product_manufacturer_id]')

    click_on 'Update Product template'

    product_template.reload
    expect(page).to have_content(product_template.name)
    expect(page).to have_content(product_template.price)
    expect(page).to have_content(product_template.description)
  end

  it '#create' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    ProductCategory.create(name: 'Кальян', description: 'Описание')
    ProductManufacturer.create(name: 'Dark Side', description: 'Описание')

    visit new_admins_product_template_path

    fill_in 'Name', with: 'Кальян'
    fill_in 'Price', with: '500'
    fill_in 'Description', with: 'Описание'
    select('Кальян', from: 'product_template[product_category_id]')
    select('Dark Side', from: 'product_template[product_manufacturer_id]')

    click_on 'Create Product template'

    expect(page).to have_content('Кальян')
    expect(page).to have_content('500')
    expect(page).to have_content('Описание')
  end
end
