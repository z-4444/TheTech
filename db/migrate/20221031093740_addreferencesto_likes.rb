class AddreferencestoLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :product, index: true
    add_reference :likes, :user
  end
end
