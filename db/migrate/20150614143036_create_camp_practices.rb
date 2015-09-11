class CreateCampPractices < ActiveRecord::Migration
  def change
    create_table :camp_practices do |t|
			t.string :name 
			t.datetime :starts_at 
			t.integer :camp_activity_id 
      t.timestamps null: false
    end
  end
end
