require './lib/solutions/HLO/hello.rb'

describe Hello do
  it "says hello to the world" do
    expect(subject.hello("name")).to eq("Hello, World!")
  end
end
