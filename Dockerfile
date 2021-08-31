FROM cimg/ruby:2.7.4

COPY --chown=circleci:circleci Gemfile* ./

RUN bundle install --jobs $(nproc) --retry 3 && \
        rm -rf Gemfile* .bundle
