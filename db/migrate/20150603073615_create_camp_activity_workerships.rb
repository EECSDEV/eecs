class CreateCampActivityWorkerships < ActiveRecord::Migration
  def change
    create_table :camp_activity_workerships do |t|
      t.integer :camp_worker_id 
      t.integer :camp_activity_id 

      t.timestamps null: false
    end
  end
end
