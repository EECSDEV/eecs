class AddClassificationToCampWorker < ActiveRecord::Migration
  def change
  	add_column :camp_workers , :level , :integer 
  	add_column :camp_workers , :department , :integer 
  	add_column :camp_workers , :team , :integer 

	
	end
end
