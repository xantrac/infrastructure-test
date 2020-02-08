defmodule WeatherWeb.WeatherView do
  use WeatherWeb, :view

  def render("index.json", %{forecast: forecast}) do
    %{
      date: forecast.date,
      type: forecast.type,
      description: forecast.description,
      temperature: forecast.temperature,
      wind: forecast.wind,
      precip_prob: forecast.precip_prob,
      daily: render_daily(forecast.daily)
    }
  end

  defp render_daily(dailies) do
    Enum.map(dailies, fn daily -> Map.from_struct(daily) end)
  end
end
