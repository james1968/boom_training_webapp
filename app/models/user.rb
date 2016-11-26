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
  

  def has_mobile_number?
  	!self.mobile_number.nil?
  end

  def has_image_file?
    self.image.nil?
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

  def success_rate
    if completed_training_sessions.count > 0 && failed_training_sessions.count == 0
      100
    elsif completed_training_sessions.count > 0 && failed_training_sessions.count > 0
      total = failed_training_sessions.count + completed_training_sessions.count
      puts "TOTAL=>#{total}"
      puts "completed_training_sessions=>#{completed_training_sessions.count}"
      completed_training_sessions.count / total * 100
    else
      "N/A"
    end
  end

  def completed_training_sessions
    self.training_sessions.where(training_completed: "Hells YEAH")
  end

  def failed_training_sessions
    self.training_sessions.where(training_completed: "Didn't do it")
  end

  def pending_training_sessions
    seelf.training_sessions.where(training_completed: "Not yet bud")
  end
end
