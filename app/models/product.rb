class Product < ActiveRecord::Base
  PERMITTED_PARAMS = [:name, :content]

  validates :name, :content, presence: true
end