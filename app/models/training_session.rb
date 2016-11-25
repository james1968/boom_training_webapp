class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :reviewed_training_sessions, through: :reviews, source: :training_session

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
end
