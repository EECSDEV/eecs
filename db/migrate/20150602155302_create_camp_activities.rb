class CreateCampActivities < ActiveRecord::Migration
  def change
    create_table :camp_activities do |t|
			t.string :name
      t.timestamps null: false
    end
  end
end
