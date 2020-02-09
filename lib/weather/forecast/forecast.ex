defmodule Weather.Forecast.Forecast do
  alias Weather.Forecast.Current
  alias Weather.Forecast.Daily

  def generate_forecast(%{"currently" => currently, "daily" => %{"data" => data}}) do
    Current.forecast_from_map(currently)
    |> (&%Weather.Forecast.Current{&1 | daily: Daily.generate_daily_forecast(data, &1.date)}).()
  end
end
