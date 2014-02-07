class DrivenMManufacturer < ActiveRecord::Base
  belongs_to :driven
  belongs_to :m_manufacturer, class_name: M::Manufacturer.name
end
