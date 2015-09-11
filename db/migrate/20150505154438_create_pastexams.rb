class CreatePastexams < ActiveRecord::Migration
  def change
    create_table :pastexams do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :file
      t.integer :exam_type
      t.boolean :has_answer
      t.integer :year

      t.timestamps null: false
    end
  end
end
