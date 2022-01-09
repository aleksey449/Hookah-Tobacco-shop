class CreateProductTemplates < ActiveRecord::Migration[6.1]
  def change
  create_table  :product_templates do |t|
      t.money   :base_price
      t.string  :name
      t.string  :description
      t.string  :image
      t.integer :category
      t.integer :manufacturer_id
      t.timestamps
      :created_at, :updated_at
    end
  end
end
