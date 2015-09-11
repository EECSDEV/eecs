class SomeUpdate < ActiveRecord::Migration
  def change
    add_column :users , :maxrank , :integer
    change_column :users , :is_admin , :integer
    
    add_column :feedbacks, :lecture_way , :text
    add_column :feedbacks, :lecture , :text
    add_column :feedbacks, :test_homework , :text
    add_column :feedbacks, :partitioning , :text
    add_column :feedbacks, :other , :text
  end
end
