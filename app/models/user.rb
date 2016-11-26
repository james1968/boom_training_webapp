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


  has_many :memberships
  has_many :groups, :through => :memberships, :source => :group


  has_many :training_session_joins
  has_many :training_sessions, :through => :training_session_joins, :source => :training_session

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/png']

  #has_many :friends, through: :friendships, source: :second_user

  def has_mobile_number?
  	!self.mobile_number.nil?
  end

  def friends
  	friend_ones + friend_twos
  end

  def belongs_to_group(group)
    group.users.include?(self)
  end

  def belongs_to_training_session(session)
    session.users.include?(self)
  end 
end
