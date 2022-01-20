# frozen_string_literal: true

class ProductManufacturer < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :product_template
end
