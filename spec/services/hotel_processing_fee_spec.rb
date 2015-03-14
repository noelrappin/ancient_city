require 'spec_helper'

describe HotelProcessingFee do

  it "returns zero for a hotel under $250" do
    hotel = double(price: 100)
    calculator = HotelProcessingFee.new(hotel)
    expect(calculator.fee).to eq(Money.zero)
  end

  it "returns $10 for a hotel that is greater than $250" do
    hotel = double(price: 300)
    calculator = HotelProcessingFee.new(hotel)
    expect(calculator.fee).to eq(Money.new(1000))
  end

end
