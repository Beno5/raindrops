class PagesController < ApplicationController
  def home
    @results = (1..24).map { |number| [number, raindrops(number)] }
  end
end
