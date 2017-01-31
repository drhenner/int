class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.decimal :price
      t.string :name
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
