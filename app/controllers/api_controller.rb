class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def test_setup
    @data = { data: {} }
    render json: @data, status: 200
  end

  def setup
  end
end
