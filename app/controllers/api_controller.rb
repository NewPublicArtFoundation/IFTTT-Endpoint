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
    location_url = result["geometry"]["coordinates"][0].to_s + ', ' + result["geometry"]["coordinates"][1].to_s

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
    result = request_publicart location

    if result.count >= limit
      results = result.slice(0, limit)
    else
      results
    end

    results.each do |result|
      data << get_new_pieces_in_area_items result
    end

    return data
  end

  def request_publicart location
    url = 'http://www.publicart.io/find.json?search=' + url_encode(location)
    response = HTTParty.get(url)
    body = JSON.parse(response)
    return body["data"]
  end

  def render_error message
    render json: { errors: [ { message: message } ] }, status: 400
  end

  def setup
  end
end
