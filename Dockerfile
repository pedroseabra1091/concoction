###
### First Stage - Building the Release
###
FROM hexpm/elixir:1.12.3-erlang-24.1.2-alpine-3.14.2 AS build

# Install build dependencies
RUN apk add --no-cache git build-base nodejs npm

# Prepare build dir
WORKDIR /build

# Install hex + rebar
RUN mix local.hex --if-missing --force && \
    mix local.rebar --force

ENV MIX_ENV=prod

# Install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# Build assets
COPY assets assets
RUN mix assets.deploy

# Compose and build project
COPY priv priv
COPY lib lib
RUN mix compile

# Build release
RUN mix release

###
### Second Stage - Setup the Runtime Environment
###
FROM alpine:3.14
RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache bash openssl libgcc libstdc++ ncurses-libs

RUN mkdir /app
WORKDIR /app

# Copy OTP binary from the build step
COPY --from=build /build/_build/prod/rel/concoction ./

# Copy Docker entrypoint
COPY priv/scripts/docker-entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

# Create non-root user
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app
ENTRYPOINT [ "docker-entrypoint.sh" ]
