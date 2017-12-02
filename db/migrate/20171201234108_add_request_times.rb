class AddRequestTimes < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :start_time, :datetime
    add_column :questions, :end_time, :datetime
  end
end
