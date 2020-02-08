defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller
  alias Weather.DarkSkyClient

  def index(conn, _params) do
    {:ok, body} = DarkSkyClient.get_forecast({11, 22})

    render(conn, "index.json", %{foo: "bar"})
  end
end
