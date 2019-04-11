require './lib/solutions/CHK/checkout.rb'

describe Shop do
  context "individual items" do
    it "prices up individual items" do
      expect(subject.checkout('A')).to eq (50)
      expect(subject.checkout('B')).to eq (30)
      expect(subject.checkout('C')).to eq (20)
      expect(subject.checkout('D')).to eq (15)
      expect(subject.checkout('E')).to eq (40)
      expect(subject.checkout('F')).to eq (10)
      expect(subject.checkout('G')).to eq (20)
      expect(subject.checkout('H')).to eq (10)
      expect(subject.checkout('I')).to eq (35)
      expect(subject.checkout('J')).to eq (60)
      expect(subject.checkout('K')).to eq (80)
      expect(subject.checkout('L')).to eq (90)
      expect(subject.checkout('M')).to eq (15)
      expect(subject.checkout('N')).to eq (40)
      expect(subject.checkout('O')).to eq (10)
      expect(subject.checkout('P')).to eq (50)
      expect(subject.checkout('Q')).to eq (30)
      expect(subject.checkout('R')).to eq (50)
      expect(subject.checkout('S')).to eq (30)
      expect(subject.checkout('T')).to eq (20)
      expect(subject.checkout('U')).to eq (40)
      expect(subject.checkout('V')).to eq (50)
      expect(subject.checkout('W')).to eq (20)
      expect(subject.checkout('X')).to eq (90)
      expect(subject.checkout('Y')).to eq (10)
      expect(subject.checkout('Z')).to eq (50)
    end
  end

  context "detects invalid items" do
    it "detects null basket" do
      expect(subject.checkout("")).to eq (0)
    end

    it "returns -1 when a single invalid item passed in" do
      expect(subject.checkout('z')).to eq (-1)
    end

    it "detects numeric elements" do
      expect(subject.checkout(6)).to eq (-1)
    end

    it "detects array elements" do
      expect(subject.checkout(['something'])).to eq (-1)
    end

    it "detects multiple invalid items" do
      expect(subject.checkout('xyz')).to eq (-1)
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

  it "prices up new bundles" do
    expect(subject.checkout('AAA')).to eq(130)
    expect(subject.checkout('AAAAA')).to eq(200)
    expect(subject.checkout('BB')).to eq(45)
    expect(subject.checkout('HHHHH')).to eq(45)
    expect(subject.checkout('HHHHHHHHHH')).to eq(80)
    expect(subject.checkout('KK')).to eq(150)
    expect(subject.checkout('PPPPP')).to eq(200)
    expect(subject.checkout('QQQ')).to eq(80)
    expect(subject.checkout('VV')).to eq(90)
    expect(subject.checkout('VVV')).to eq(130)
  end

  it "prices up new bonus items" do
    expect(subject.checkout('EEB')).to eq(80)
    expect(subject.checkout('EEBB')).to eq(110)
    expect(subject.checkout('FFF')).to eq(20)
    expect(subject.checkout('NNNM')).to eq(120)
    expect(subject.checkout('RRRQ')).to eq(150)
    expect(subject.checkout('RRRQQQ')).to eq(210)
    expect(subject.checkout('UUUU')).to eq(120)
  end
end



