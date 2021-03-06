class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authorize

  def not_verified
    render json: {response: 401, errors: [ { message: 'Does not have valid Access Token.' } ], status: 'Not valid'}, status: 401
  end

  private
    def authorize
      if request.headers['IFTTT-Channel-Key'] != ENV['IFTTT_Channel_Key']
        not_verified
      end
    end
end
