class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def test_setup
    @data = {
      data: {
        trigger: {},
        action: {}
      }
    }
    render json: @data, status: 200
  end

  def actions_get_closest_piece
  end

  def setup
  end
end
