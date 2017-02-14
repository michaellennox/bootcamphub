source 'https://rubygems.org'

gem 'bundler'
gem 'rake'
gem 'hanami',       '~> 0.9'
gem 'hanami-model', '~> 0.7'

gem 'pg'

gem 'slim'

# jekyll is used for building our static sites
gem 'jekyll', '~> 3.4.0'
gem 'jekyll-feed', '~> 0.8.0'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'byebug'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
