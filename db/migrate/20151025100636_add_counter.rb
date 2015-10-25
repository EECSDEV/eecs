class AddCounter < ActiveRecord::Migration
  def change
    add_column :users, :pastexams_count, :integer
    add_column :users, :feedbacks_count, :integer
    add_column :courses, :pastexams_count, :integer
    add_column :courses, :feedbacks_count, :integer
  end
end
