class CreateCampWorkers < ActiveRecord::Migration
  def change
    create_table :camp_workers do |t|
			t.string :name  
			t.string :gender
			t.integer :grade  
			t.string :email 
			t.string :cellphone
      t.timestamps null: false
    end
  end
end
