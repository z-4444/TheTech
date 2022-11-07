class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :continent
      t.string :currency
      t.integer :phone_code
      t.string :capital

      t.timestamps
    end
  end
end
