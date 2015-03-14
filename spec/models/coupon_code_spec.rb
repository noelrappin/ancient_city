require "rails_helper"

describe CouponCode do
  describe "applicability" do
    let(:trip) { Trip.new }
    let(:hotel) { Hotel.new }
    let(:activity) { Activity.new }
    let(:code) { CouponCode.new }

    describe "a general code" do
      before { code.applies_to = :all }
      specify { expect(code.ok_for(trip)).to be_truthy }
      specify { expect(code.ok_for(hotel)).to be_truthy }
      specify { expect(code.ok_for(activity)).to be_truthy }
    end

    describe "a specific code" do
      before { code.applies_to = :trip }
      specify { expect(code.ok_for(trip)).to be_truthy }
      specify { expect(code.ok_for(hotel)).to be_falsy }
      specify { expect(code.ok_for(activity)).to be_falsy }
    end
  end
end
