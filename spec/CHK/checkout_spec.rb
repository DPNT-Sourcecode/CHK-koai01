require './lib/solutions/CHK/checkout.rb'

prices = {
  'A' => 50,
  'B' => 30,
  'C' => 20,
  'D' => 15
}

describe Checkout do

  subject { Checkout.new(prices) }

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


