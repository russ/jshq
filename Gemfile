if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'haml', '3.0.25'
gem 'haml-rails'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'biceps'
gem 'carrierwave', '0.5.8'
gem 'fog'
gem 'sunspot_rails', '~> 1.3.0'
gem 'friendly_id', '~> 4.0.0.beta14'
gem 'devise'
gem 'whenever'

group :assets do
  gem 'sass-rails', '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'ffaker'
  gem 'rspec-rails', '2.6.1'
  gem 'rspec', '2.6.0'
  gem 'factory_girl_rails', '~> 1.4'
  gem 'shoulda-matchers'
  gem 'sunspot_solr'
end

group :production do
  gem 'therubyracer'
  gem 'mysql2'
end
