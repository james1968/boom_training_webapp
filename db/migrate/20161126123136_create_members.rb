class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.text :user_email
      t.text :user_name

      t.timestamps
    end
  end
end
