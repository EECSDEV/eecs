class ChangeClassYearToString < ActiveRecord::Migration
  def change
  	change_column :users , :class_year , :string 
	end
end
