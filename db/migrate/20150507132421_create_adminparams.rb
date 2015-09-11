class CreateAdminparams < ActiveRecord::Migration
  def change
    create_table :adminparams do |t|
      t.integer :point_get_feedback
      t.integer :point_get_pastexam
      t.integer :point_need_feedback

      t.timestamps null: false
    end
  end
end
