class ApplicationController < ActionController::Base
  def raindrops(number)
    return if number == 0

    sounds = {
      2 => 'pling',
      3 => 'plang',
      5 => 'plong',
      17 => 'tshäng'
    }

    result = []

    sounds.each do |divisor, sound|
      count = 0
      while number % divisor == 0
        number /= divisor
        count += 1
      end

      while count >= 4
        result << adjust_sound(sound, 4)
        count -= 4
      end
      result.unshift(adjust_sound(sound, count)) if count.positive?
    end

    result.empty? ? 'BLOB' : result.join(', ')
  end

  def adjust_sound(sound, count)
    if count == 4
      "*#{sound.upcase}* #{sound.downcase}"
    elsif count == 3
      "*#{sound.upcase}*"
    elsif count == 2
      sound.upcase
    else
      sound
    end
  end
end
