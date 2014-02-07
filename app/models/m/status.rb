class M::Status < ActiveRecord::Base

  PERMITTED_PARAMS = [:status]

  validates :status, presence: true
end