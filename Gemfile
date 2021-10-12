source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 5.2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails' # 開発環境で環境変数を操作するのに必要
gem 'unicorn' # アプリケーションサーバのunicorn
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'letter_opener_web'
  gem 'pry-rails'
  gem 'binding_of_caller'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'capistrano', '3.16.0' # capistranoのツール一式
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem 'carrierwave'
  gem 'mimemagic', '0.3.7'
  gem 'devise'
  gem 'devise-i18n'
  gem 'devise-i18n-views'
  gem 'rails_admin', '~> 2.0'
  gem 'cancancan'
  gem 'ransack', github: 'activerecord-hackery/ransack'
  gem 'kaminari'
  gem 'geocoder'
  # gem 'dotenv-rails'
  gem 'fog-aws'
