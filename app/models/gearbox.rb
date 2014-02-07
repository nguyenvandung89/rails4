class Gearbox < ActiveRecord::Base

  PERMITTED_PARAMS = [:gearbox_type, :detail]

  validates :gearbox_type, presence: true
end