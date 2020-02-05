use Mix.Config

config :weather, env: :prod

config :weather, WeatherWeb.Endpoint,
  url: [
    host: System.get_env("HOST"),
    scheme: "http",
    port: String.to_integer(System.get_env("PORT")) || 4000
  ],
  http: [
    port: String.to_integer(System.get_env("PORT")) || 4000
  ],
  server: true

config :logger, level: :info
