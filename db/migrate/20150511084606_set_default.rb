class SetDefault < ActiveRecord::Migration
  def change
    change_column :users, :maxrank, :integer, :default => 0
    change_column :users, :is_admin, :integer, :default => 0
  end
end
