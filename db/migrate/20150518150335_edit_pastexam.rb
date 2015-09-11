class EditPastexam < ActiveRecord::Migration
  def change
     add_column :pastexams, :which_time, :integer
  end
end
