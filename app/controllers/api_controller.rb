class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def test_setup
    data = {
      data: {},
      status: 200
    }
    render json: 'data', status: 200
  end

  def not_verified
    render text: '', status: 401
  end

end
