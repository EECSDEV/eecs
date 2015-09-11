class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :course_id
      t.integer :user_id
      t.text :content
      t.integer :rating
      t.integer :year

      t.timestamps null: false
    end
  end
end
