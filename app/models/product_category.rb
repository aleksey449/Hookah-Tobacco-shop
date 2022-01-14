# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
