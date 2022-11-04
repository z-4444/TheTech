class AddhasandbelongstomanyToProductsandSubcatagory < ActiveRecord::Migration[6.1]
  def change
    create_table :products_subcatagories, id: false do |t|
      t.belongs_to :product
      t.belongs_to :subcatagory
    end
  end
end
