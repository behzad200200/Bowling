require_relative 'frame'

class Bowling

  def initialize (str)
    @frames = Array.new(10) { |i| Frame.new(i+1) }
    @input_string = str
    @skip_flag = false
  end


  # moves through pins
  def moves()
    get_pins()
    roll_overload?()
    @pins.each_with_index do |pin , index|
       if skip_pin?
        next
      end
      if end_of_frame_list
        break
      end
      frame = get_current_frame
      score_frame(index , frame)
    end
    get_sum_frame()
  end

  # score
  def score_frame (index , frame)
    pin = @pins[index]
    if strike?(pin)
      add_strike_frame(index , frame)
    elsif  spare?(index , pin)
      add_spare(index , frame)
    elsif input_valid?(index)
      raise "Bad Input."
    else
      add_normal_frame(index ,frame)
    end

  end

  def get_current_frame()
    frame = @frames.find {|f| !f.finish?}
  end
  # Setter for input string that contains pin
  def input_string=(str)
    @input_string = str
  end

   # This method calculate sum of frames

    def strike?(pin)
        pin == 10
    end

    def spare?(index , pin)
      !@pins[index.succ].nil? and  @pins[index] + @pins[index.succ] == 10
    end

    def roll_overload?()
      if @pins.size() > 12
        raise "Too Rolls."
      end
    end

    def end_of_frame_list
      get_current_frame.nil?
    end

    def add_strike_frame (index , frame)
      pin = @pins[index]
      if @pins[index.succ].nil?
        frame.score = pin
      elsif @pins[index.succ.succ].nil?
        frame.score = pin + @pins[index.succ]
      else
        frame.score = pin + @pins[index.succ]+ @pins[index.succ.succ]
      end
    end

    def add_spare(index , frame)
      pin = @pins[index]
      if @pins[index.succ.succ].nil?
        frame.score = pin + @pins[index.succ]
        @skip_flag  = true
      else
        frame.score = pin + @pins[index.succ]+ @pins[index.succ.succ]
        @skip_flag  = true
      end
    end

    def add_normal_frame(index, frame)
      pin = @pins[index]
      if @pins[index.succ].nil?
        frame.score = pin
        @skip_flag  = true
      else
        frame.score = pin + @pins[index.succ]
        @skip_flag  = true
      end
    end

   def input_valid?(index)
     !@pins[index.succ].nil? and  @pins[index] + @pins[index.succ] > 10
   end
  def skip_pin?
    skip = false
    if @skip_flag == true
       @skip_flag = false
       skip = true
    end
    skip
  end
  # Split string to array of integers
  def get_pins()
    @pins = @input_string.strip.split(/\s+/).collect { |i| i.to_i }
  end

    def get_sum_frame()
    sum = 0
    @frames.each do |frame|
      if !frame.score.nil?
        sum += frame.score
      end
    end
    sum
  end
end


