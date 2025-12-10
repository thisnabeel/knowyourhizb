# syntax=docker/dockerfile:1
FROM ruby:3.2.0-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client \
    xz-utils \
    ffmpeg \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install bundler compatible with Ruby 3.2
RUN gem install bundler --no-document

# Copy Gemfile and Gemfile.lock first for better Docker layer caching
COPY Gemfile Gemfile.lock ./

# Configure bundler to exclude development and test groups
RUN bundle config set --local without 'development test'

# Install gems
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Create tmp directories for audio processing (used by Piece and Recorder models)
RUN mkdir -p tmp/raw tmp/mp3 && \
    chmod -R 755 tmp

# Expose port
EXPOSE 3000

# Set environment variables
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:3000/ || exit 1

# Run cleanup and start server
CMD ["sh", "-c", "bundle exec rake tmp:pids:clear && bundle exec rails server -b 0.0.0.0"]
