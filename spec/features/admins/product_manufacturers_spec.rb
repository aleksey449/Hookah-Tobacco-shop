# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductManufacturer do
  it '#sign_in' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    expect(page).to have_current_path(admins_dashboard_path)
  end

  it 'dashboard#index' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    visit admins_dashboard_path

    expect(page).to have_content('Добро пожаловать в админку!')
    expect(page).to have_link('Категории', href: admins_product_categories_path)
    expect(page).to have_link('Производители', href: admins_product_manufacturers_path)
  end

  it 'product_manufacturers#index' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit admins_product_manufacturers_path(product_manufacturer)

    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Destroy')
    expect(page).to have_link('New Product Manufacturer', href: new_admins_product_manufacturer_path)
  end

  it 'product_manufacturers#destroy' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit admins_product_manufacturers_path(product_manufacturer)

    click_on 'Destroy'

    expect(page).to have_current_path(admins_product_manufacturers_path)
    expect(page).not_to have_content(product_manufacturer.name)
    expect(page).not_to have_content(product_manufacturer.description)
  end

  it 'product_manufacturers#update' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    product_manufacturer = described_class.create(name: 'Кальяны', description: 'Описание')

    visit admins_product_manufacturers_path(product_manufacturer)

    click_on 'Edit'
    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Update Product manufacturer'

    product_manufacturer.reload
    expect(page).to have_content(product_manufacturer.name)
    expect(page).to have_content(product_manufacturer.description)
  end

  it 'product_manufacturers#create' do
    Admin.create(email: 'admin@example.com', password: 'password', confirmed_at: DateTime.now)
    visit admin_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    visit new_admins_product_manufacturer_path

    fill_in 'Name', with: 'Кальян'
    fill_in 'Description', with: 'Из нержавеющей стали'
    click_on 'Create Product manufacturer'
    expect(page).to have_content('Кальян')
    expect(page).to have_content('Из нержавеющей стали')
  end
end
