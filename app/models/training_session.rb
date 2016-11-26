class TrainingSession < ApplicationRecord
  
  has_many :reviewed_training_sessions, through: :reviews, source: :training_session
  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  has_many :training_session_joins
  has_many :users, :through => :training_session_joins, :source => :user

  def average_rating
    reviews.average(:rating)
  end
end
