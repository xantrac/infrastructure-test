# Build Stage
FROM elixir:1.9 AS builder

WORKDIR /app
ENV MIX_ENV=prod

RUN mix local.hex --force && \
  mix local.rebar --force

COPY mix.exs mix.lock ./
RUN mix do deps.get --only prod, deps.compile

RUN mv mix.lock mix.lock.backup
COPY . .
RUN mv mix.lock.backup mix.lock

RUN mix distillery.release --env=prod

# Deploy Stage
FROM elixir:1.9-slim

WORKDIR /app

COPY --from=builder /app/releases/weather ./

ENTRYPOINT ["./bin/weather"]
CMD ["foreground"]
