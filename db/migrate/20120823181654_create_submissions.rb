class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.integer :user_id
      t.string :url
      t.text :student_notes
      t.integer :score

      t.timestamps
    end
  end
end
