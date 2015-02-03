source 'https://rubygems.org'
ruby '2.0.0'

# Backend
gem 'rails'
gem 'jbuilder', '~> 2.0'
gem 'spring',        group: :development
# gem 'unicorn'
# gem 'rack-timeout'
gem 'sidekiq'
gem 'simple_form'
gem 'twilio-ruby'
gem 'chronic'
gem 'whenever', :require => false
gem 'sidetiq'

# Frontend
gem 'foundation-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# # Auth
gem 'devise'
gem 'devise_uid'
gem 'devise-token_authenticatable'
# gem 'devise_invitable'
# gem 'omniauth'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'

# # Analytics
gem 'newrelic_rpm'

# Other
gem 'httparty'
gem 'kaminari'

group :development do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'sqlite3'
  # gem 'spork-rails', '4.0.0'
  gem 'childprocess'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

