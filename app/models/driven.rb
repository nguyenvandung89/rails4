class Driven < ActiveRecord::Base

  require "carrierwave/orm/activerecord"
    
  PERMITTED_PARAMS = [:driven_type, :detail, :image, :image_cache, :remove_image, :m_manufacturer_ids => []]

  validates :driven_type, presence: true
  
  mount_uploader :image, PictureUploader
  
  has_many :m_manufacturers, class_name: M::Manufacturer.name,
    through: :driven_m_manufacturers
  has_many :driven_m_manufacturers
end