require './lib/solutions/HLO/hello.rb'

describe Hello do
  it "says hello to the world" do
    expect(subject.hello("World")).to eq("Hello, World!")
  end

  it "says hello to John" do
    expect(subject.hello("John")).to eq("Hello, John!")
  end
end
