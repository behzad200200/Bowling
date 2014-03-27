require_relative 'frame'

class Bowling

  def initialize (str)
    @frames = Array.new(10) { |i| Frame.new(i+1) }
    @input_string = str
  end
  # Split string to array of integers
  def get_pins()
    @pins = @input_string.strip.split(/\s+/).collect { |i| i.to_i }
  end

  # Calculate each frame from
  def count()
    pins = get_pins
    if pins.size() > 12
      raise "Too Rolls."
    end
    skip_flag = false
    pins.each_with_index do |pin , index|
      if skip_flag == true
        skip_flag = false
        next
      end
      frame = @frames.find {|f| !f.finish?}
      if frame.nil?
          break
      end
      if pin == 10
        if pins[index.succ].nil?
          frame.score = pin
        elsif pins[index.succ.succ].nil?
          frame.score = pin + pins[index.succ]
        else
        frame.score = pin + pins[index.succ]+ pins[index.succ.succ]
        end
      elsif  !pins[index.succ].nil? and  pin + pins[index.succ] == 10
        if pins[index.succ.succ].nil?
          frame.score = pin + pins[index.succ]
          skip_flag  = true
        else
          frame.score = pin + pins[index.succ]+ pins[index.succ.succ]
          skip_flag  = true
        end
      elsif !pins[index.succ].nil? and  pin + pins[index.succ] > 10
        raise "Bad Input."
      else
        if pins[index.succ].nil?
          frame.score = pin
          skip_flag  = true
        else
          frame.score = pin + pins[index.succ]
          skip_flag  = true
        end
      end
    end
    get_sum_frame()
  end

  # Setter for input string that contains pin
  def input_string=(str)
    @input_string = str
  end

   # This method calculate sum of frames
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


