class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :lesson_id
      t.text :question
      t.string :correct_answer

      t.timestamps
    end
  end
end
