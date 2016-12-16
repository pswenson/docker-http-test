FROM andrius/alpine-ruby
RUN apk update && apk upgrade && \
  apk add bash && \
  apk-install ruby-dev build-base && \
  gem install --no-ri --no-rdoc rest-client && \
  apk del ruby-dev build-base && \
  rm -rf /var/cache/apk/*

COPY test.rb .
RUN chmod +x test.rb

ENTRYPOINT ["./test.rb"]