class CreateOrderproducts < ActiveRecord::Migration[6.1]
  def change
    create_table :orderproducts do |t|
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
