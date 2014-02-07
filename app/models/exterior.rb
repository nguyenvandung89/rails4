class Exterior < ActiveRecord::Base

  PERMITTED_PARAMS = [:color]

  validates :color, presence: true
end