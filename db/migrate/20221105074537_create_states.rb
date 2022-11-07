class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :country_name
      t.integer :state_id

      t.timestamps
    end
  end
end
