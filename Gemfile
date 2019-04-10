source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', "2.0"
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'mini_magick'
gem 'devise'
gem 'kaminari'
gem 'moip2'
gem 'whenever', require: false
 
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'ffaker'
  gem 'dotenv-rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'selenium-webdriver', '~> 3.0'
  gem 'rspec-expectations', '~> 3.4'
end
 
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-yarn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]