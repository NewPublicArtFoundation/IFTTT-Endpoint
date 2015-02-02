class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  def not_verified
    render json: {response: 401, status: 'Not valid'}, status: 401
  end

  private
    def authorize
      if request.headers['IFTTT-Channel-Key'] != ENV['IFTTT_Channel_Key']
        not_verified
      end
    end
end
