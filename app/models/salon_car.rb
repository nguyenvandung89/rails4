class SalonCar < ActiveRecord::Base
  require "carrierwave/orm/activerecord"

  PERMITTED_PARAMS = [:name, :description, :address, :tel, :image1, :image1_cache,
    :remove_image1, :image2, :image2_cache, :remove_image2, :image3, :image3_cache,
    :remove_image3, :image4, :image4_cache, :remove_image4, :image5, :image5_cache,
    :remove_image5, :image6, :image6_cache, :remove_image6, :background, :background_cache,
    :remove_background]

  validates :name, :address, presence: true
  mount_uploader :image1, PictureUploader
  mount_uploader :image2, PictureUploader
  mount_uploader :image3, PictureUploader
  mount_uploader :image4, PictureUploader
  mount_uploader :image5, PictureUploader
  mount_uploader :image6, PictureUploader
  mount_uploader :background, PictureUploader
end