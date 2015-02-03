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

  def get_new_pieces_in_area_items location, id
    image_url = ''
    location_url = ''

    item = {
      public_art: image_url,
      location: location_url,
      meta: {
        id: SecureRandom.base64.to_s,
        timestamp: Time.now.to_i
      }
    }

    return item
  end

  def triggers_new_piece_in_area
    data = []
    id = request['X-Request-ID']

    if params[:triggerFields][:location].nil?
      render json: {errors: ['Does not have Location']}, status: 400
    end

    if params[:triggerFields].nil?
      render json: {errors: ['Does not have TriggerFields']}, status: 400
    end

    location = params[:triggerFields][:location]
    limit = params[:limit]

    data << get_new_pieces_in_area_items(location, id)
    data << get_new_pieces_in_area_items(location, id)
    data << get_new_pieces_in_area_items(location, id)

    if !limit.nil?
      data = data.slice(0, limit.to_i)
    end

    @data = {
      data: data
    }

    render json: @data, status: 200
  end

  def setup
  end
end
