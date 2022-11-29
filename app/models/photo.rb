class Photo < ApplicationRecord
  belongs_to :shop

  mount_uploader :image, ThumbnailUploader
end
