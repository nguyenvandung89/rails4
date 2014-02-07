class M::Origin < ActiveRecord::Base

  PERMITTED_PARAMS = [:name, :detail]

  validates :name, presence: true
end