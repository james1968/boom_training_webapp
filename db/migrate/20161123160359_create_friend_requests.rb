class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.string :sender
      t.string :recepient
      t.boolean :confirmed

      t.timestamps
    end
  end
end
