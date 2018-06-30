source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'

gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'

# Plugins
gem 'figaro', '1.1.1'
gem 'paperclip', '5.1.0'
gem 'aws-sdk', '>=2.0.0'
gem 'decent_exposure', '3.0.2'
gem 'friendly_id', '5.2.3'
gem 'rails_admin', github: 'nicocedron/rails_admin'
gem 'devise', '4.3.0'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'kaminari'

#Front end
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '4.3.1'

group :production, :staging do
  gem 'pg'
  gem 'heroku-deflater'
end

group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
