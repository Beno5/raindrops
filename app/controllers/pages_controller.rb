class PagesController < ApplicationController
  def home
    @results = (1..24).map { |number| [number, raindrops(number)] }
    @generated_result = [params[:id], raindrops(params[:id].to_i)]
  end

  def raindrops(number)
    sounds = {
      2 => "pling",
      3 => "plang",
      5 => "plong",
      17 => "tshäng"
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
  
      if count.positive?
        result.unshift(adjust_sound(sound, count))  
      end
      
    end
  
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
