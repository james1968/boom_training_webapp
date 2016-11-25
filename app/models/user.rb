class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, class_name: "Friendship",
  											 foreign_key: "first_user_id",
  											 dependent: :destroy

  has_many :friendship_ones, :class_name => 'Friendship', :foreign_key => :second_user_id
	has_many :friend_ones, through: :friendship_ones, source: :first_user
	has_many :friendship_twos, :class_name => 'Friendship', :foreign_key => :first_user_id
	has_many :friend_twos, through: :friendship_twos, source: :second_user
  
  has_many :groups

  #has_many :friends, through: :friendships, source: :second_user

  def has_mobile_number?
  	!self.mobile_number.nil?
  end

  def friends
  	friend_ones + friend_twos
  end
end
