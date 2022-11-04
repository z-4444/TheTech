class CreateSubcatagories < ActiveRecord::Migration[6.1]
  def change
    create_table :subcatagories do |t|
      t.string :name

      t.timestamps
    end
  end
end
