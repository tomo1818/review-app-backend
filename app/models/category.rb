class Category < ApplicationRecord
  belongs_to :group
  has_many :shops, dependent: :destroy
  mount_uploader :thumbnail, ThumbnailUploader
end
