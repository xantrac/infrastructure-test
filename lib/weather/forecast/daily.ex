defmodule Weather.Forecast.Daily do
  defstruct date: nil,
            type: nil,
            description: nil,
            temperature: %{
              low: nil,
              high: nil
            }

  def generate_daily_forecast(list, current_day) do
    list
    |> Enum.map(&forecast_from_map(&1))
    |> Enum.filter(&(&1.date != current_day))
  end

  defp forecast_from_map(%{
         "time" => time,
         "icon" => icon,
         "summary" => summary,
         "temperatureMin" => temperatureMin,
         "temperatureMax" => temperatureMax
       }) do
    %__MODULE__{
      date: TimeConverter.unix_to_datestring(time),
      type: icon,
      description: summary,
      temperature: %{
        low: temperatureMin,
        high: temperatureMax
      }
    }
  end
end
