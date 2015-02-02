class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def test_setup
    @data = {
      data: {
        samples: {
          triggers: {
            new_piece_in_area: {
              location: "new york city"
            }
          },
        }
      }
    }
    render json: @data, status: 200
  end

  def triggers_new_piece_in_area
  end

  def setup
  end
end
