class AddAvatarsToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatars, :string
  end
end
