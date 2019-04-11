require './lib/solutions/CHK/basket.rb'

describe Basket do
  subject { described_class.new('test')}
  it "initializes with correct variables" do
    expect(subject.items).to be_an_instance_of(Array)
    expect(subject.cost).to eq(0)
    expect(subject.bundles).to be_an_instance_of(Array)
    expect(subject.individual_items).to be_an_instance_of(Array)
  end
end
