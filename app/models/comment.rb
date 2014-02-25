class Comment < ActiveRecord::Base

  PERMITTED_PARAMS = [:car_id]
  belongs_to :car
  belongs_to :visitor

end