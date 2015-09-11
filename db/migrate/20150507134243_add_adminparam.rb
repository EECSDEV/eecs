class AddAdminparam < ActiveRecord::Migration
  def change
    add_column :adminparams, :point_need_pastexam, :integer
  end
end
