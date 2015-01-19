class ApiController < ApplicationController
  def status
    render status: 200
  end
end
