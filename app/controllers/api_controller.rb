class ApiController < ApplicationController

  def status
    render text: '', status: 200
  end

  def test_setup
    @data = {
      data: {
        samples: {
          trigger: {
            new_piece_in_area: {
              location: "new york city"
            }
          },
          action: {
            get_closest_piece: {
              url: "http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10683752_458280327647217_295471039_n.jpg"
            }
          }
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
