defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller
  alias Weather.DarkSkyClient
  alias Weather.Forecast.Forecast

  def index(conn, %{"latitude" => latitude, "longitude" => longitude}) do
    case DarkSkyClient.get_forecast({latitude, longitude}) do
      {:ok, body} ->
        forecast = Forecast.generate_forecast(body)
        render(conn, "index.json", %{forecast: forecast})

      {:error, %{"code" => code, "error" => error}} ->
        text(conn, "Status #{code} #{error}")
    end
  end
end
