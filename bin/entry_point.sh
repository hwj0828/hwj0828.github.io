#!/usr/bin/env bash
set -euo pipefail

# Install missing gems without deleting or restoring the local lockfile.
bundle check || bundle install
exec bundle exec jekyll serve --host=0.0.0.0 --port=8080 --livereload --force_polling
