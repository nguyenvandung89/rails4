class Like < ActiveRecord::Base

  PERMITTED_PARAMS = [:visitor_id, :car_id]
  belongs_to :visitor
  belongs_to :car

  validates :visitor_id, uniqueness: {scope: :car_id}
end