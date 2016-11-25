class CreateGroupInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :group_invites do |t|
      t.string :group_name
      t.string :user_email

      t.timestamps
    end
    add_index :group_invites, :group_name
    add_index :group_invites, :user_email
    add_index :group_invites, [:group_name, :user_email], unique: true
  end
end
