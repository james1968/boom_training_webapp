class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reviewed_training_sessions, through: :reviews, source: :training_session

end
