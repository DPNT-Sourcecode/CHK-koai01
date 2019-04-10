require './lib/solutions/CHK/checkout.rb'

prices = {
  'A' => 50,
  'B' => 30,
  'C' => 20,
  'D' => 15
}

describe Checkout do

  subject { Checkout.new(prices) }

  context "prices individual items" do
    it "prices up A" do
      expect(subject.checkout('A')).to eq(50)
    end

    it "prices up B" do
      expect(subject.checkout('B')).to eq (30)
    end

    it "prices up C" do
      expect(subject.checkout('C')).to eq (20)
    end

    it "prices up D" do
      expect(subject.checkout('D')).to eq (15)
    end
  end

  context "detects invalid items" do
    it "returns -1 when a single invalid item passed in" do
      expect(subject.checkout('Z')).to eq (-1)
    end
  end

  context "prices up multiple items" do
    it "prices up AB" do
      expect(subject.checkout('AB')).to eq (80)
    end
  end

end



