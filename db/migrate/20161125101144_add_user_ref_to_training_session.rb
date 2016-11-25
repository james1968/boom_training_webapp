class AddUserRefToTrainingSession < ActiveRecord::Migration[5.0]
  def change
    add_reference :training_sessions, :user, foreign_key: true
  end
end
