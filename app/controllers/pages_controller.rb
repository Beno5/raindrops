class PagesController < ApplicationController
  def home
    @results = [ raindrops(128) ]
  end

  def raindrops(number)
    sounds = {
      2 => "pling",
      3 => "plang",
      5 => "plong",
      17 => "tshäng"
    }
  
    result = sounds.map do |divisor, sound|
      count = 0
      while number % divisor == 0
        number /= divisor
        count += 1
      end
      if count.positive?
        output = adjust_sound(sound, count)
       # while count.positive?
       #   count - 4
       #   [output].push(adjust_sound(sound, count))
       # end
      end
    end.compact

    result.empty? ? "BLOB" : result.join(', ')
  end

  def adjust_sound(sound, count)
    
    if count == 4
      return "*#{sound.upcase}* #{sound.downcase}"
    elsif count == 3
      return "*#{sound.upcase}*"
    elsif count == 2
      return sound.upcase
    else
      return sound
    end
  end
end
