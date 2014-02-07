class Currency < ActiveRecord::Base

  PERMITTED_PARAMS = [:name, :name_en]

  validates :name, :name_en, presence: true
end