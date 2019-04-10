require './lib/solutions/CHK/checkout.rb'

describe Checkout do
  it "responds to this test" do
    expect(subject.checkout('skus')).to raise_error('Not implemented')
  end
end
