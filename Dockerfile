FROM alpine:3.3

RUN apk add --no-cache  \
  bash \
  curl \
  ca-certificates \
  unzip \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip \
  > /tmp/browserstack.zip && \
  unzip /tmp/browserstack.zip -d /tmp && \
  mv /tmp/BrowserStackLocal /usr/bin/browserstack

ADD discover /usr/bin/discover

CMD browserstack -v -forcelocal -localIdentifier $BROWSERSTACK_ID $BROWSERSTACK_KEY
