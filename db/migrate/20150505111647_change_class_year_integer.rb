class ChangeClassYearInteger < ActiveRecord::Migration
  def change
 		change_column :users, :class_year , :string , :limit => 3
 	end
end
