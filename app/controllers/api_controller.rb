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
    if params[:triggerFields].nil? ||params[:triggerFields][:location].nil?
      render_error 'Does not have field'
      return
    end
    id = request['X-Request-ID']
    location = params[:triggerFields][:location]

    if !params[:limit].nil?
      limit = params[:limit]
    else
      limit = 50
    end
    data = get_data_from_publicart location, limit
    render json: { data: data }, status: 200
  end

  def get_new_pieces_in_area_items result
    image_url = result["properties"]["title"]
    location = result["geometry"]["coordinates"][0].to_s + ', ' + result["geometry"]["coordinates"][1].to_s
    location_url = 'http://maps.googleapis.com/maps/api/staticmap?center=' + location + '&zoom=13&scale=false&size=600x300&maptype=roadmap&format=png&visual_refresh=true'

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

  def get_data_from_publicart location, limit
    data = []
    results = request_publicart location

    i = 0
    results.each do |result|
      if(i < limit)
        data << get_new_pieces_in_area_items(result)
      end
      i = i + 1
    end

    return data
  end

  def request_publicart location
    url = 'http://www.publicart.io/find.json?search=' + URI.encode(location)
    data = HTTParty.get(url)
    return data["data"]
  end

  def render_error message
    render json: { errors: [ { message: message } ] }, status: 400
  end

  def setup
  end
end
