class AddreferencestoComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :product, index: true
    add_reference :comments, :user
  end
end
