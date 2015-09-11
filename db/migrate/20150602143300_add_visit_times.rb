class AddVisitTimes < ActiveRecord::Migration
  def change
    add_column :pastexams, :download_time, :integer, :default => 0
    add_column :feedbacks, :visit_time, :integer, :default => 0
  end
end
