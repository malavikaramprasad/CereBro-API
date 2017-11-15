class CreatePreferredLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :preferred_locations do |t|
      t.string :name
      t.references :user
      t.decimal :x_coordinate
      t.decimal :y_coordinate

      t.timestamps
    end
  end
end
