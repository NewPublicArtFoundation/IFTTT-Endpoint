class ApiController < ApplicationController
  before_filter :authorize

  def status
    render text: '', status: 200
  end

  def not_verified
    render text: '', status: 401
  end

  private
    def authorize
      if request.headers['IFTTT-Channel-Key'] != ENV['IFTTT_Channel_Key']
        not_verified
      end
    end
end
