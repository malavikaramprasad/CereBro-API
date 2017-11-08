class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :description
      t.integer :tag_id
      t.integer :learner_id

      t.timestamps
    end
  end
end
