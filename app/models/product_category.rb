# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :product_template
end
