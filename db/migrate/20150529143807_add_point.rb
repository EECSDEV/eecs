class AddPoint < ActiveRecord::Migration
  def change
    add_column :pastexams, :point_get, :integer
    add_column :feedbacks, :point_get, :integer
  end
end
