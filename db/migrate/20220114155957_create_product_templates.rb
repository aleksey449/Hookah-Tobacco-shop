class CreateProductTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :product_templates do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.money :price, null: false
      t.references :product_category, index: true, foreign_key: true
      t.references :product_manufacturer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
