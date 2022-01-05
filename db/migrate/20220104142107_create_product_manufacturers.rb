class CreateProductManufacturers < ActiveRecord::Migration[6.1]
  def change
    create_table :product_manufacturers do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
