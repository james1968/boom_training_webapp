class Group < ApplicationRecord
  has_many :users
  has_many :members, dependent: :destroy

  validates :name, length: { minimum: 1 }, uniqueness: true
end
