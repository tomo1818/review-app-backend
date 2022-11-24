class Tag < ApplicationRecord
  belongs_to :group
  
  has_many :shop_tag, dependent: :destroy
  has_many :shops, through: :shop_tag
end
