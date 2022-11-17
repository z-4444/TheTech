class AddQuantityToOrderproducts < ActiveRecord::Migration[6.1]
  def change
    add_column :orderproducts, :quantity, :string
  end
end
