class Group < ApplicationRecord
  has_many :users

  validates :name, length: { minimum: 1 }, uniqueness: true
end
