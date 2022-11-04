class AddStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :status, :integer, default: 0
    add_column :catagories, :status, :integer, default: 0
    add_column :subcatagories, :status, :integer, default: 0

  end
end
