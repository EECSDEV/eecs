class AddPastexam < ActiveRecord::Migration
  def change
    add_column :pastexams, :description, :string
  end
end
