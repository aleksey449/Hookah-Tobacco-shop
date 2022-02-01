# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_categories = [
  ['Кальяны', 'Прибор для курения'],
  ['Табачные смеси', 'Табачная смесь для кальяна'],
  ['Колбы', 'Неотъемлемая часть кальяна'],
  ['Чаши', 'Бывают разными, но все служат для курения табачной смеси'],
  ['Уголь', 'То, что чаще всего забывают купить, а если серьезно, то предназначен для нагрева табака'],
  ['Аксессуары', 'Все то, что нужно докупить отдельно']
]

product_categories.each do |name, description|
  ProductCategory.create(name: name, description: description)
end

product_manufacturers = [
  ['Dark Side', 'Производитель кальянов, табака и аксессуаров'],
  ['Alpha Hookah', 'Производитель кальянов и аксессуаров'],
  ['Craft', 'Производитель кальянов и аксессуаров'],
  ['DSH', 'Производитель кальянов'],
  ['Hoob', 'Производитель кальянов и аксессуаров'],
  ['Maklaud', 'Производитель кальянов и аксессуаров'],
  ['MattPear', 'Производитель кальянов, табака и аксессуаров'],
  ['Nube', 'Производитель кальянов и аксессуаров'],
  ['Union', 'Производитель кальянов и аксессуаров'],
  ['Shadows Hookah', 'Производитель кальянов'],
  ['Хулиган', 'Производитель кальянов, табака и аксессуаров'],
  ['Koress', 'Производитель кальянов'],
  ['Bonche', 'Производитель табака'],
  ['Daily Hookah', 'Производитель табака'],
  ['Duft', 'Производитель табака'],
  ['Must Have', 'Производитель табака'],
  ['Black Burn', 'Производитель табака'],
  ['Северный', 'Производитель табака']
]

product_manufacturers.each do |name, description|
  ProductManufacturer.create(name: name, description: description)
end

product_templates = [
  ['Black Burn', '(Табак со вкусом кислой черной смородины 100 г', 750, 2, 17],
  ['Dark Side', 'Cosmo Flower (Табак со вкусом черники с цветами)', 1770, 2, 1],
  ['Duft', 'Apple Candy (Табак со вкусом яблоко)', 840, 2, 15]
]

product_templates.each do |name, description, price, product_category_id, product_manufacturer_id|
  ProductTemplate.create(name: name, description: description, price: price, product_category_id: product_category_id,
                         product_manufacturer_id: product_manufacturer_id)
end
