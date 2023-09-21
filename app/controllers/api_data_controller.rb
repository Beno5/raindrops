class ApiDataController < ApplicationController
  def get_data
    result = raindrops(params[:number].to_i)

    render json: { success: true, result: }
  end
end
