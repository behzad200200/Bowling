require_relative 'frame'

class Bowling

  def initialize (str)
    @input_string = str
  end


  def get_pins()
    @pins = @input_string.strip.split(/\s+/).collect { |i| i.to_i }
  end

  def count()
     pins = get_pins
    frames = Array.new(10) { |i| Frame.new(i+1) }
     skip_flag = false
    pins.each_with_index do |pin , index|
      if skip_flag == true
        skip_flag = false
        next
      end
      frame = frames.find {|f| !f.finish?}
          if index > 9
            break
          end
          if pin == 10
            if  pins[index.succ].nil?
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
    sum = 0
    frames.each do |frame|
      if !frame.score.nil?
        sum +=frame.score
      end

    end
   sum
  end
  def input_string=(str)
    @input_string = str
  end
end


test = Bowling.new("10 10 10 2 10 10 10 10 10 1")
puts test.count()
