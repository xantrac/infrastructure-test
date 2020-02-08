defmodule Weather.Forecast.Current do
  defstruct date: nil,
            type: nil,
            description: nil,
            temperature: nil,
            wind: nil,
            precip_prob: nil,
            daily: []

  @spec forecast_from_map(map) :: Weather.Forecast.Current.t()
  def forecast_from_map(%{
        "time" => time,
        "icon" => icon,
        "summary" => summary,
        "temperature" => temperature,
        "windSpeed" => windSpeed,
        "windBearing" => windBearing,
        "precipProbability" => precipProbability
      }) do
    %__MODULE__{
      date: TimeConverter.unix_to_datestring(time),
      type: icon,
      description: summary,
      temperature: temperature,
      wind: %{speed: windSpeed, bearing: windBearing},
      precip_prob: precipProbability
    }
  end
end
