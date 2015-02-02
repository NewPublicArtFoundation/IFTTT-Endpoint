class ApiController < ApplicationController
  def status
    render text: '', status: 200
  end

  private
    def authorize
      if request.headers['IFTTT-Channel-Key'] != ENV['IFTTT_Channel_Key']
        render text: '', status: 401
      end
    end
  before_filter :authorize
end
