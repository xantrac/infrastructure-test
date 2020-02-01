use Mix.Config

config :weather, env: :prod

config :weather, WeatherWeb.Endpoint,
  http: [port: 4000],
  url: [host: "localhost", port: 4000],
  server: true

config :logger, level: :info
