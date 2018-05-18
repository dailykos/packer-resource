FROM hashicorp/packer:latest

ADD .gemrc /root/.gemrc

RUN apk update \
  && apk add ruby \
             ruby-bigdecimal \
             ruby-bundler \
             ruby-io-console \
             ruby-irb \
             ca-certificates \
             libressl \
  && apk add --virtual build-dependencies \
                       build-base \
                       ruby-dev \
                       libressl-dev \
  && bundle config build.nokogiri --use-system-libraries \
  && bundle config git.allow_insecure true \
  && gem install json  \
  && gem install berkshelf -v '~> 6.3' \
  && gem cleanup \
  && apk del build-dependencies \
  && rm -rf /usr/lib/ruby/gems/*/cache/* \
            /var/cache/apk/* \
            /tmp/* \
            /var/tmp/*

ADD bin /opt/resource
