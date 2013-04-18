require "./baseball_counter"
describe BaseballCounter do
  before(:each) do
    @counter = BaseballCounter.new
    @counter.count("s")
  end
  it "should count strike upto 2, and when it comes 3, clear s, b, and count up o " do
    @counter.count("s") == "010"
    @counter.count("ss") == "010,020"
    @counter.count("sss") == "010,020,100"
    @counter.count("ssbs") == "010,020,120,100"
  end
  it "should count ball upto 3, and clear s and b" do
    @counter.count("bbb") == "001,002,003"
    @counter.count("ssbbb") == "010,020,021,022,023"
    @counter.count("ssbbbb") == "010,020,021,022,023,000"
  end
  it "should clear s and b when h" do
    @counter.count("hsbhfhbh") == "000,010,011,000,010,000,001,000"
  end
  it "should clear strike and ball, and ++out when p" do
    @counter.count("bbssp") == "001,002,012,022,100"
  end
  it "becomes 000 when 3 outs" do
    @counter.count("ppp") == "100,200,000"
    @counter.count("ppsbp") == "100,200,210,211,000"
  end
  it "should ++strike if it is not 2 when receives faul" do
    @counter.count("ssffpffssp") == "010,020,020,020,100,110,120,200,210,000"
  end
end
