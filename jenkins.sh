#!/bin/bash -xe

# Gemfile.lock is not in source control because this is a gem
rm -f Gemfile.lock

git clean -fdxe

bundle install --path "${HOME}/bundles/${JOB_NAME}"
bundle exec rake

if [[ -n "$PUBLISH_GEM" ]]; then
  bundle exec rake publish_gem
fi
