class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.string :state

      t.integer :tracking_number
      t.string  :shipping_method

      t.string :shipping_address1
      t.string :shipping_address2
      t.string :shipping_zipcode
      t.string :shipping_state
      t.boolean :is_shipped

      t.datetime :completed_at

      t.timestamps
    end
  end
end
