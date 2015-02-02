class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def testSetup
    render json: 'data'
  end
end
