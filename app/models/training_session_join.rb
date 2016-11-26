class TrainingSessionJoin < ApplicationRecord
	belongs_to :training_session
	belongs_to :user
end
