class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :country_id, :integer, foreign_key: true
    add_column :cities, :country_id, :integer, foreign_key: true
    add_column :cities, :state_id, :integer, foreign_key: true
  end
end
