class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.decimal :rating
      t.references :question

      t.timestamps
    end
  end
end
