class AddPointDefault < ActiveRecord::Migration
  def change
    change_column :pastexams, :point_get, :integer, :default => 0 
    change_column :feedbacks, :point_get, :integer, :default => 0 
  end
end
