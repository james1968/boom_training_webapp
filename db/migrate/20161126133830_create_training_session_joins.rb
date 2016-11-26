class CreateTrainingSessionJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :training_session_joins do |t|
      t.integer :training_session_id
      t.integer :user_id

      t.timestamps
    end
    add_index :training_session_joins, :training_session_id
    add_index :training_session_joins, :user_id
    add_index :training_session_joins, [:training_session_id, :user_id], unique: true
  end
end
