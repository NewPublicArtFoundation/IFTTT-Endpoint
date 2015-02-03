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
    if params[:triggerFields].nil? ||params[:triggerFields][:location].nil?
      render_error 'Does not have field'
      return
    end
    id = request['X-Request-ID']
    location = params[:triggerFields][:location]
    limit = params[:limit]
    data = get_data_from_publicart location, limit
    render json: { data: data }, status: 200
  end

  def get_data_from_publicart location, limit

  end

  def request_publicart location
    url = URI.parse('http://www.publicart.io/find.json?search=' + url_encode(location) )
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
  end

  def render_error message
    render json: { errors: [ { message: message } ] }, status: 400
  end

  def setup
  end
end
