class CreateFriendsLists < ActiveRecord::Migration[7.0]
  def change
    create_table :friends_lists do |t|
      t.string :full_name
      t.string :about
      t.string :email
      t.string :phone
      t.string :twitter
      t.timestamps
    end
  end
end
