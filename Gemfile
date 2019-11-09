# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'active_model_serializers', '0.10.10'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'feedjira'
gem 'httparty'
gem 'interactor', '~> 3.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors', '1.0.2'
gem 'rails', '~> 6.0.1'
gem 'rubocop', '0.76.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'database_cleaner', '1.7.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '0.17.1', require: false
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails', '5.1.1'
  gem 'faker', '2.7.0'
  gem 'hashdiff', '1.0.0'
  gem 'pry-byebug', '3.7.0'
  gem 'rspec-rails', '3.9.0'
  gem 'rspec_api_documentation', '6.1.0'
  gem 'selenium-webdriver', '3.142.6'
  gem 'webmock', '~> 3.6', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
