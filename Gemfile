source 'https://rubygems.org'

# rails-assets.org is deprecated. Consider using bootstrap gem directly:
# gem 'bootstrap', '~> 5.3'
# Or keep using rails-assets if you need it (though it's deprecated):
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end

ruby '3.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.1.1'

# Rails 8 requires an explicit web server
gem 'puma', '~> 6.0'

# AWS SDK v3 - using service-specific gems for better performance
gem 'aws-sdk-s3', '~> 1.0'

gem 'active_model_serializers'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Note: Rails 8 defaults to dartsass-rails, but sass-rails is still compatible
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'stripe'


gem 'momentjs-rails'


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Rails 8 includes Turbo (Hotwire) built-in. Turbolinks gem is no longer needed.
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.13'
# Jbuilder 2.13 is compatible with Rails 8
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 2.1', group: :doc

# wysiwyg-rails doesn't support Rails 7.0+ (constraint: < 7.0)
# Rails 8 includes Action Text. Consider alternatives like: action_text, trix-rails, or quill_rails
# gem 'wysiwyg-rails', '~> 2.1'
gem "figaro"

gem 'devise', '~> 4.9'
# Devise 4.9+ is compatible with Rails 8

gem 'rails_12factor', group: :production

gem 'pusher'
gem 'rack-cors', :require => 'rack/cors'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 4.2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end