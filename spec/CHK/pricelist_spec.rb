require './lib/solutions/CHK/pricelist.rb'

describe Pricelist do
  it "initializes with pricelist hash" do
    expect(subject.pricelist).to be_an_instance_of(Hash)
  end
end
