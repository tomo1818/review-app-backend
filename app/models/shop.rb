class Shop < ApplicationRecord
  belongs_to :group
  belongs_to :category

  has_many :shop_tag, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tags, through: :shop_tag
end
