class M::LifeCar < ActiveRecord::Base

  PERMITTED_PARAMS = [:m_manufacturer_id, :name, :content]
  belongs_to :m_manufacturer, class_name: M::Manufacturer.name

  validates :m_manufacturer_id, :name, presence: true
end