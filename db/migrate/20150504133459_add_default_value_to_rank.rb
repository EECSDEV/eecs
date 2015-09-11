class AddDefaultValueToRank < ActiveRecord::Migration
  def change
  	change_column :users ,:rank , :integer , :default => 0 
	
	end
end
