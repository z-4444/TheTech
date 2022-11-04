class RemoveField < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :country, :string
    remove_column :users, :state, :string
    remove_column :users, :city, :string
  end
end
