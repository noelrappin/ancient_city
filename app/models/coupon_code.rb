class CouponCode < ActiveRecord::Base
  has_many :order_line_items
end
