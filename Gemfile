source 'https://rubygems.org'

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
gem 'stripe'

gem 'jbuilder', '~> 2.13'

# wysiwyg-rails doesn't support Rails 7.0+ (constraint: < 7.0)
# Rails 8 includes Action Text. Consider alternatives like: action_text, trix-rails, or quill_rails
# gem 'wysiwyg-rails', '~> 2.1'
gem 'devise', '~> 4.9'
# Devise 4.9+ is compatible with Rails 8

gem 'rails_12factor', group: :production

gem 'pusher'
gem 'rack-cors', :require => 'rack/cors'

gem 'ruby-openai', '~> 4.2'

gem 'figaro'

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