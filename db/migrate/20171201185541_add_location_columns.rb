class AddLocationColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :x_coordinate, :decimal
    add_column :users, :y_coordinate, :decimal
    add_column :users, :start_time, :time
    add_column :users, :end_time, :time
  end
end
