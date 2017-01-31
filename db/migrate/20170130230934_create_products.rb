class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.boolean :active
      t.string :product_type
      t.text :description
      t.string :permalink
      t.text :keywords

      t.timestamps
    end
  end
end
