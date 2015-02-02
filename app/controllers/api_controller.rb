class ApiController < ApplicationController
  def status
    if request.headers['IFTTT-Channel-Key'] == ENV['IFTTT_Channel_Key']
      render text: '', status: 200
    else
      render text: '', status: 401
    end
  end
end
