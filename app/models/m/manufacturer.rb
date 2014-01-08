class M::Manufacturer < ActiveRecord::Base
  validates :name, :name_en, presence: true
end