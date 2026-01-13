# Use the official Ruby image from Docker Hub
FROM ruby:2.7.8

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    sqlite3 \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set environment to production
ENV RAILS_ENV production
ENV SECRET_KEY_BASE dummy-key-for-build

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]