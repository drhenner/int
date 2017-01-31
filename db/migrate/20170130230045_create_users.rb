class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.boolean :is_active
      t.boolean :is_new_user
      t.boolean :wants_email

      t.timestamps
    end
  end
end
