FROM cimg/ruby:3.0.2

COPY --chown=circleci:circleci Gemfile* ./

RUN bundle install --jobs $(nproc) --retry 3 && \
        rm -rf Gemfile* .bundle
