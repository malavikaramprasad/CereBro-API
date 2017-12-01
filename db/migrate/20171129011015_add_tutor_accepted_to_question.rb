class AddTutorAcceptedToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :tutor_accepted, :boolean
  end
end
