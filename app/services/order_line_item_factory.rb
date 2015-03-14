class OrderLineItemFactory
  attr_accessor :order, :buyable, :unit_price, :amount,
      :fee_calculator_class, :coupon_code

  def initialize(order, buyable, unit_price, amount, coupon_code, fee_calculator_class)
    @order, @buyable, @unit_price, @amount = order, buyable, unit_price, amount
    @coupon_code = coupon_code
    @fee_calculator_class = fee_calculator_class
  end

  def extended_price
    amount * unit_price
  end

  def processing_fee
    fee_calculator_class.new(buyable).fee
  end

  def price_paid
    extended_price - discount + processing_fee
  end

  def coupon_code_applies?
    coupon_code && coupon_code.ok_for(buyable)
  end

  def discount
    return 0 unless coupon_code_applies?
    (coupon_code.discount_percentage * extended_price) / 100.0
  end

  def run
    order.order_line_items.new(buyable: buyable, unit_price: unit_price,
        amount: amount, extended_price: extended_price,
        processing_fee: processing_fee, price_paid: price_paid,
        discount: discount)
  end
end
