class AddreferenceToCatgory < ActiveRecord::Migration[6.1]
  def change
    add_reference :catagories, :user, index: true
    add_reference :subcatagories, :user, index: true
  end
end
