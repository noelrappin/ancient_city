class Order < ActiveRecord::Base

  has_many :order_line_items
  belongs_to :user
  monetize :total_price_paid_cents, allow_nil: true

  def trip_item
    order_line_items.where(buyable_type: "Trip").first
  end

  def hotel_item
    order_line_items.where(buyable_type: "Hotel").first
  end

  def activity_items
    order_line_items.where(buyable_type: "Activity")
  end

end
