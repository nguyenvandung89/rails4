class M::Prefecture < ActiveRecord::Base

  PERMITTED_PARAMS = [:name, :roman_name, :sort]

  validates :name, :roman_name, presence: true
end