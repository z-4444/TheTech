class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :country
    add_reference :users, :state
    add_reference :users, :city
  end
end
