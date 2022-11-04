class Addreferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :imageable, polymorphic: true, index: true
  end
end
