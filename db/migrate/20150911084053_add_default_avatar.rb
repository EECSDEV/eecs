class AddDefaultAvatar < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, :default => 'public/uploads/user/default_avatar.JPG'
  end
end
