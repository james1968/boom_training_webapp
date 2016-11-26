class Group < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships, :source => :user


  validates :name, length: { minimum: 1 }, uniqueness: true
end
