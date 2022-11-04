class Changestatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :catagories, :status
    remove_column :subcatagories, :status
  end
end
