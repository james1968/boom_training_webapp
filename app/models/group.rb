class Group < ApplicationRecord
  has_many :users
  belongs_to :user
  validates :name, length: { minimum: 1 }, uniqueness: true
end
