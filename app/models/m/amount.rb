class M::Amount < ActiveRecord::Base

  PERMITTED_PARAMS = [:amount]

  validates :amount, presence: true
end