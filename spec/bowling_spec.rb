require_relative 'spec_helper '

describe Bowling do
  describe "it has correct output" do
    let(:player) {Bowling.new("")}
    it "return currentt moves" do
      player.input_string = "1 9 9 1"
      player.moves.should eq(29)
    end
    it "returns correct 12 strikes" do
      player.input_string = "10 10 10 10 10 10 10 10 10 10 10 10"
      player.moves.should eq(300)
    end
    it "returns complex combination result correct" do
      player.input_string = "10 4 5 9 1 10 7 3 5 5 2 3"
      player.moves.should eq(100)
    end
  end
  describe "should show correct exception" do
    let(:player) {Bowling.new("")}
    it " show error for too rolls" do
      player.input_string = "10 10 10 10 10 10 10 10 10 10 10 10 10 10"
      expect { player.moves }.to raise_error("Too Rolls.")
    end
    it  "show error for sum of two roll in one frame is bigger than 10" do
      player.input_string = "2 9 8 1 3"
      expect { player.moves }.to raise_error("Bad Input.")
    end
  end

  context "functions" do
    before(:all) do
      @game = Bowling.new("4 4 4 4 4 4 4")
    end
    it "get_current_frame" do
      frame = @game.get_current_frame()
      @game.get_frames.index(frame).should eq(0)
      @game.set_pins
    end

    it "score_frame" do
      @game.score_frame(0 , @game.get_frames[0]).should eq(true)
    end
  end
  context "variable after initialize" do
    before(:all) do
      @game = Bowling.new("4 4 4 4 4 4 4")
      @game.set_pins
    end
    it "pins arrays has correct size" do
      @game.get_pins.size().should eq(7)
    end

  end

end

