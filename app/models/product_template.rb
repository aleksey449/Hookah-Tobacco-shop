# frozen_string_literal: true

class ProductTemplate < ApplicationRecord
  # validates_numericality_of :price,  ;dgreater_than => 0, :less_than => 10
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :product_category
  belongs_to :product_manufacturer
end
