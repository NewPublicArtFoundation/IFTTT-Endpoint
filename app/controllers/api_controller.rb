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

  def get_new_pieces_in_area_items
    image_url = ''
    location_url = ''
    items = []

    item = {
      public_art: image_url,
      location: location_url,
      meta: {
        id: '',
        timestamp: Time.now.iso8601
      }
    }

    items << item

    return items
  end

  def triggers_new_piece_in_area
    @data = {
      data: get_new_pieces_in_area_items
    }

    render json: @data, status: 200
  end

  def setup
  end
end
