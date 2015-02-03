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
    id = request['X-Request-ID']

    if params[:triggerFields].nil?
      render_error 'Does not have field'
      return
    end

    if params[:triggerFields][:location].nil?
      render_error 'Does not have field'
      return
    end
    if params[:triggerFields][:location][:address] != nil
      location = params[:triggerFields][:location][:address]
    elsif
      location = params[:triggerFields][:location]
    end

    location = URI.encode(location.to_s)

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
    created_date = result["discovered"]
    location = result["geometry"]["coordinates"][0].to_s + ', ' + result["geometry"]["coordinates"][1].to_s
    location_url = URI.encode('http://maps.googleapis.com/maps/api/staticmap?center=' + location + '&markers=' + location + '&zoom=14&scale=false&size=600x300&maptype=roadmap&format=png&visual_refresh=true')
    latitude = result["geometry"]["coordinates"][0].to_s
    longitude = result["geometry"]["coordinates"][1].to_s

    item = {
      public_art: image_url,
      location: location_url,
      latitude: latitude,
      longitude: longitude,
      created_date: created_date,
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
    url = 'http://www.publicart.io/find.json?search=' + location
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    return data["data"]
  end

  def render_error message
    render json: { errors: [ { message: message } ] }, status: 400
  end

  def setup
  end
end
