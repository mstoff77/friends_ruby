class AddUserIdToFriendsLists < ActiveRecord::Migration[7.0]
  def change
    add_column :friends_lists, :user_id, :integer
    add_index :friends_lists, :user_id
  end
end
