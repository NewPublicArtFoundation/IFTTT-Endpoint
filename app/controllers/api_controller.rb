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

  def get_new_pieces_in_area_item
    image_url = ''
    location_url = ''

    item = {
      public_art: image_url,
      location: location_url,
      meta: {
        id: '',
        timestamp: Time.now.iso8601
      }
    }
    return item
  end

  def triggers_new_piece_in_area
    item = get_new_pieces_in_area_item
    items = [ item ]

    @data = {
      data: items
    }

    render json: @data, status: 200
  end

  def setup
  end
end
