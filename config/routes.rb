Rails.application.routes.draw do
  root 'api#status'

  # Setup/Test
  match 'api/v1/ifttt/v1/status',      to: 'api#status',    via: [:get]
  match 'api/v1/ifttt/v1/test/setup',  to: 'api#test_setup', via: [:get, :post]

  # Trigger
  match 'api/v1/ifttt/v1/triggers/new_piece_in_area',  to: 'api#triggers_new_piece_in_area', via: [:get, :post]

end
