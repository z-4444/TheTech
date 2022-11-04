class AddReferencesToproduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :subcatagory, index: true
    add_reference :products, :user, index: true
    add_reference :subcatagories, :catagory, index: true
    add_column :products, :images, :string
    add_reference :products, :imageable, polymorphic: true, index: true
  end
end
