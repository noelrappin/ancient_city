require 'rails_helper'

describe ActivityProcessingFee do

  it "always returns $5" do
    calculator = ActivityProcessingFee.new(double)
    expect(calculator.fee).to eq(Money.new(500))
  end

end
