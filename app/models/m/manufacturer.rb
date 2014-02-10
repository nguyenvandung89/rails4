class M::Manufacturer < ActiveRecord::Base

  require "carrierwave/orm/activerecord"

  PERMITTED_PARAMS = [:name, :name_en, :sort, :logo, :logo_cache, :remove_logo, :driven_ids => []]

  validates :name, :name_en, presence: true
  mount_uploader :logo, PictureUploader
  
  has_many :drivens, through: :driven_m_manufacturers
  has_many :driven_m_manufacturers, foreign_key: :m_manufacturer_id
  has_many :cars, foreign_key: :m_manufacturer_id
end