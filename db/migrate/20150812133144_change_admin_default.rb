class ChangeAdminDefault < ActiveRecord::Migration
  def change
    change_column :users, :is_admin, :integer, :default => -1
  end
end
