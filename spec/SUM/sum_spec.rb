require './lib/solutions/SUM/sum.rb'

describe Sum do
  it "adds two numbers together" do
    expect(subject.sum(1,2)).to eq(3)
  end
end

