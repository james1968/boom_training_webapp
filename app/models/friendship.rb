class Friendship < ApplicationRecord
	belongs_to :first_user, class_name: "User"
	belongs_to :second_user, class_name: "User"
	validates :first_user_email, presence: true
	validates :second_user_email, presence: true
end
