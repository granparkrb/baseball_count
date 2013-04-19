require_relative "./spec_helper"
require_relative "../lib/ball_game"

shared_examples_for "Ball game countable" do |input, output|
  context "入力値が #{input} のとき" do
    before do
      @ballgame = BallGame.new
    end
    subject { @ballgame.print_counts_by_stream(input) }
    it { should eq output }
  end
end

describe "BaseballCount" do
  describe "#count" do
    it_behaves_like "Ball game countable", "s", "010"
    it_behaves_like "Ball game countable", "sss", "010,020,100"
    it_behaves_like "Ball game countable", "bbbb", "001,002,003,000"
    it_behaves_like "Ball game countable", "ssbbbb", "010,020,021,022,023,000"
    it_behaves_like "Ball game countable", "hsbhfhbh", "000,010,011,000,010,000,001,000"
    it_behaves_like "Ball game countable", "psbpfpbp", "100,110,111,200,210,000,001,100"
    it_behaves_like "Ball game countable", "ppp", "100,200,000"
    it_behaves_like "Ball game countable", "ffffs", "010,020,020,020,100"
    it_behaves_like "Ball game countable", "ssspfffs", "010,020,100,200,210,220,220,000"
    it_behaves_like "Ball game countable", "bbbsfbppp", "001,002,003,013,023,000,100,200,000"
    it_behaves_like "Ball game countable", "sssbbbbsbhsbppp", "010,020,100,101,102,103,100,110,111,100,110,111,200,000,100"
    it_behaves_like "Ball game countable", "ssffpffssp", "010,020,020,020,100,110,120,200,210,000"
  end
end
