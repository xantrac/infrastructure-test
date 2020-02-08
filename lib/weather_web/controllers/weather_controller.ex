defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller
  alias Weather.DarkSkyClient
  alias Weather.Forecast.Forecast

  def index(conn, %{"latitude" => latitude, "longitude" => longitude}) do
    forecast =
      DarkSkyClient.get_forecast({latitude, longitude})
      |> Forecast.generate_forecast()

    render(conn, "index.json", %{forecast: forecast})
  end
end
