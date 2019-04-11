require './lib/solutions/CHK/shop.rb'

prices = {
  'A' => 50,
  'B' => 30,
  'C' => 20,
  'D' => 15
}

deals = [
  {'item' => 'A', 'quantity' => 3, 'price' => 130},
  {'item' => 'B', 'quantity' => 2, 'price' => 45}
]

describe Shop do
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

    it "prices up E" do
      expect(subject.checkout('E')).to eq(40)
    end

    it "prices up F" do
      expect(subject.checkout('F')).to eq(10)
    end
  end

  context "detects invalid items" do
    it "detects null basket" do
      expect(subject.checkout("")).to eq (0)
    end

    it "returns -1 when a single invalid item passed in" do
      expect(subject.checkout('Z')).to eq (-1)
    end

    it "detects numeric elements" do
      expect(subject.checkout(6)).to eq (-1)
    end

    it "detects array elements" do
      expect(subject.checkout(['something'])).to eq (-1)
    end

    it "detects multiple invalid items" do
      expect(subject.checkout('XYZ')).to eq (-1)
    end
  end

  context "prices up multiple items" do
    it "prices up AB" do
      expect(subject.checkout('AB')).to eq (80)
    end

    it "prices up BCD" do
      expect(subject.checkout('BCD')).to eq (65)
    end
  end

  context "prices bundles" do
    it "prices up 3A" do
      expect(subject.checkout('AAA')).to eq (130)
    end

    it "prices up 3A and others" do
      expect(subject.checkout('ABACAD')).to eq (195)
    end

    it "prices up 2B" do
      expect(subject.checkout('BB')).to eq (45)
    end

    it "prices up 5A for 200" do
      expect(subject.checkout('AAAAA')).to eq(200)
    end

    it "correctly prices up 9A" do
      expect(subject.checkout('AAAAAAAAA')).to eq(380)
    end

    it "prices up '2E get one B free'" do
      expect(subject.checkout('EEB')).to eq(80)
    end

    it "prices up 2E without a B" do
      expect(subject.checkout('EE')).to eq(80)
    end

    it "prices up Es with bonus Bs" do
      expect(subject.checkout('EEEBBBBAAAAAD')).to eq(410)
    end

    it "prices up 2F and 3F correctly" do
      expect(subject.checkout('FF')).to eq(20)
      expect(subject.checkout('FFF')).to eq(20)
      expect(subject.checkout('FFFFF')).to eq(40)
    end

    it "prices up F with others" do
      expect(subject.checkout('FFFFFAAAAAEEB')).to eq(320)
    end
  end
end
