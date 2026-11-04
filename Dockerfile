FROM ruby:3.3.5-slim

# Local preview environment; the same Ruby version is used by GitHub Actions.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git imagemagick nodejs zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV EXECJS_RUNTIME=Node \
    JEKYLL_ENV=development \
    LANG=C.UTF-8

WORKDIR /srv/jekyll
COPY Gemfile ./
RUN gem install --no-document bundler -v 2.7.2 && bundle install

COPY bin/entry_point.sh /tmp/entry_point.sh
EXPOSE 8080 35729
CMD ["bash", "/tmp/entry_point.sh"]
