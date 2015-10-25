class FixCounter < ActiveRecord::Migration
  def change
    change_column :users, :pastexams_count, :integer, :default => 0
    change_column :users, :feedbacks_count, :integer, :default => 0
    change_column :courses, :pastexams_count, :integer, :default => 0 
    change_column :courses, :feedbacks_count, :integer, :default => 0
  end
end
