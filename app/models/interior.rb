class Interior < ActiveRecord::Base

  PERMITTED_PARAMS = [:color]

  validates :color, presence: true
end