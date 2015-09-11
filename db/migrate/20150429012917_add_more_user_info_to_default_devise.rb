class AddMoreUserInfoToDefaultDevise < ActiveRecord::Migration
  def change
 		add_column  :users , :username   , :string 
		add_column  :users , :class_year , :integer
		add_column  :users , :is_admin   , :boolean
		add_column  :users , :rank       , :integer 
		add_column  :users , :description, :text 
		add_column  :users , :first_name , :string 
		add_column  :users , :last_name  , :string 
		add_column  :users , :nick_name  , :string 
  end
end
