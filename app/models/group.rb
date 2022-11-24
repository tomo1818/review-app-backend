class Group < ApplicationRecord
  has_many :user_group, dependent: :destroy
  has_many :users, through: :user_group
  has_many :categories, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :name, presence: true
end
