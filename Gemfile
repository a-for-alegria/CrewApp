source 'https://rubygems.org'
ruby '2.1.5'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.2'
gem 'bcrypt-ruby', '3.1.2'
gem 'faker', '1.1.2'
gem 'jquery-datatables-rails'
gem 'jquery-ui-rails'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1', require: false
end

gem 'haml-rails', '>= 0.3.4'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.3.0'
gem 'jbuilder', '1.0.2'
gem 'cucumber-rails', '1.4.0', :require => false
gem 'database_cleaner', github: 'bmabey/database_cleaner'
gem 'pony'
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end