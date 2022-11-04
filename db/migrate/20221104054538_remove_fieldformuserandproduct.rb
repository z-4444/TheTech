class RemoveFieldformuserandproduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :imageable_type, :string
    remove_column :products, :imageable_type, :string
  end
end
