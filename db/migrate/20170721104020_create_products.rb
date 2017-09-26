class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :shop
      t.string :name
      t.integer :price, default: 0

      t.timestamps null: false
    end
  end
end
