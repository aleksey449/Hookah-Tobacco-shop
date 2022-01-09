class ProductManufacturer < ApplicationRecord
        validates :name, presence: true
        validates :description, presence: true, length: { minimum: 10 }
 end
