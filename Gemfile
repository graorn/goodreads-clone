# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap', '~> 4.1.2'
gem 'devise'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'pundit'
gem 'ransack'
gem 'responders'
gem 'simple_form'
gem 'simplecov', require: false, group: :test
gem 'acts_as_favoritor', github: 'jonhue/acts_as_favoritor'
gem 'google-cloud-storage', '~> 1.8', require: false
gem 'jquery-validation-rails'
gem 'valid_email2'
gem 'ffaker'
gem 'autoprefixer-rails'
gem 'activeadmin'
gem 'gravatar_image_tag', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'guard-annotate'
  gem 'guard-rspec', require: false
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop-rails_config'
  gem 'sqlite3'
  gem 'switch_user'
  gem 'rubocop-rspec'
  gem 'fuubar'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end

group :development do
  gem 'brakeman'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-rubocop'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-livereload'
  gem 'rails_db', '2.0.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
