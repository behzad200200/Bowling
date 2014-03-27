require_relative 'spec_helper '

describe Bowling do
  describe "it has correct output" do
    let(:player) {Bowling.new("")}
    it "return currentt count" do
      player.input_string = "1 9 9 1"
      player.count.should eq(29)
    end
    it "returns correct 12 strikes" do
      player.input_string = "10 10 10 10 10 10 10 10 10 10 10 10"
      player.count.should eq(300)
    end
    it ""
  end
  describe "it should show correct error" do
    let(:player) {Bowling.new("")}
    it "it is bigger than 10" do
      player.input_string = "10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 1"
      expect { player.count }.to raise_error("too rolls.")
    end
    it
  end
end
