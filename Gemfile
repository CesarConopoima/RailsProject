source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.0'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
# gema simple captcha para autentificacion humanoide
gem "galetahub-simple_captcha", :require => "simple_captcha"

gem "heroku"
group :development, :test do
	gem 'sqlite3'
end
group :production do
  gem 'pg'
end
group :production do
  gem 'thin'
  gem 'rails_12factor'
end
# using papper clip and ws3 from amazon to upload images
gem "paperclip"
gem 'aws-sdk'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem "devise"
gem "cancan"

gem 'jquery-rails'

gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Pagination for larger request

gem 'will_paginate', '~> 3.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
