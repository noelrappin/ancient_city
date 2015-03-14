class CouponCode < ActiveRecord::Base
  has_many :order_line_items

  def ok_for(buyable)
    return true if applies_to.blank? || applies_to == "all"
    buyable.class.name.downcase == applies_to
  end
end
