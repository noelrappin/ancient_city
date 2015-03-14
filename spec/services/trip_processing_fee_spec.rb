require 'rails_helper'

describe TripProcessingFee do

  it "returns expected trip that is within 100 years" do
    trip = double(start_date: Date.parse("Jan 1, 2000"))
    calculator = TripProcessingFee.new(trip)
    expect(calculator.fee).to eq(Money.new(15))
  end

  it "returns expected for a trip that is after 100 years" do
    trip = double(start_date: Date.parse("Jan 1, 1900"))
    calculator = TripProcessingFee.new(trip)
    expect(calculator.fee).to eq(Money.new(115))
  end

end
