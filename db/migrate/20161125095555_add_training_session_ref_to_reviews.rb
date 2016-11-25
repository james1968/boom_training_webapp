class AddTrainingSessionRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :training_session, foreign_key: true
  end
end
