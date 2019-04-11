require './lib/solutions/CHK/deals.rb'

describe Deals do
  it "initializes with deal_list hash" do
    expect(subject.deal_list).to be_an_instance_of(Array)
  end
end
