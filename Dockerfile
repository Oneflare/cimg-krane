FROM cimg/ruby:3.2.2

RUN sudo apt update && \
    sudo apt install python pip && \
    pip install pyyaml && \
    curl -L -o openapi2jsonschema.py "https://raw.githubusercontent.com/yannh/kubeconform/master/scripts/openapi2jsonschema.py" && \
    chmod 755 openapi2jsonschema.py && \
    sudo mv openapi2jsonschema.py /usr/bin/openapi2jsonschema.py

COPY --chown=circleci:circleci Gemfile* ./

RUN bundle install --jobs $(nproc) --retry 3 && \
        rm -rf Gemfile* .bundle
