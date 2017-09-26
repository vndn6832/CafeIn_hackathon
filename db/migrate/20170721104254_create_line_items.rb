class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.string :size
      t.text :request
      t.integer :product_id
      t.integer :cart_id
      t.integer :order_id
      
      t.integer :user_id
      t.integer :shop_id
      t.integer :waiting
      
      t.timestamps null: false
    end
  end
end
