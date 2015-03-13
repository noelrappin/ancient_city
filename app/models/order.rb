class Order < ActiveRecord::Base

  has_many :order_line_items
  belongs_to :user
  monetize :total_price_paid_cents, allow_nil: true

end
