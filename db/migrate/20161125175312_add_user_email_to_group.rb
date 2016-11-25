class AddUserEmailToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :user_email, :text
  end
end
