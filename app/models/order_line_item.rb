class OrderLineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :buyable, polymorphic: true
  belongs_to :coupon_code

end
