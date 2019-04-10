require './lib/solutions/CHK/checkout.rb'

describe Checkout do
  it "prices up A" do
    expect(subject.checkout('A')).to eq(50)
  end

  it "prices up B" do
    expect(subject.checkout('B')).to eq (30)
  end

  it "prices up C" do
    expect(subject.checkout('C')).to eq (20)
  end
end

