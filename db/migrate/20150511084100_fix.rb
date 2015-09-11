class Fix < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :lecture 
  end
end
