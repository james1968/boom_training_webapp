class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.string :first_user_email
      t.string :second_user_email

      t.timestamps
    end
    add_index :friendships, :first_user_email
    add_index :friendships, :second_user_email
    add_index :friendships, [:first_user_email,:second_user_email], unique: true
  end
end
