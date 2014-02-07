class PostBuyCar < ActiveRecord::Base
  PERMITTED_PARAMS = [:m_amount_id, :title, :content]
  belongs_to :m_amount, class_name: M::Amount.name

  validates :m_amount_id, :title, presence: true
end