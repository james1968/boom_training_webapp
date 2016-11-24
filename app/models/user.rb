class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, class_name: "Friendship",
  											 foreign_key: "first_user_email",
  											 dependent: :destroy
  has_many :friends, through: :friendships, source: :second_user

  def has_mobile_number?
  	!self.mobile_number.nil?
  end	
end
	