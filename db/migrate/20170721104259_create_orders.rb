class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address

      t.integer :user_id
      t.integer :shop_id
      
      t.timestamps null: false
    end
  end
end
