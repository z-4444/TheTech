class RemoveSubcatagoryidFromProdct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :subcatagory_id
  end
end
