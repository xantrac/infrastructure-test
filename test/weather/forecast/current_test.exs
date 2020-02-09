defmodule Weather.Forecast.CurrentTest do
  use ExUnit.Case
  alias Weather.Forecast.Current

  test "forecast_from_map, take a map of weather information and returns a current forecast struct" do
    forecast_map = %{
      "time" => 12_897_986,
      "icon" => "sun",
      "summary" => "it'sunny",
      "temperature" => 34,
      "windSpeed" => 45,
      "windBearing" => 44,
      "precipProbability" => 100
    }

    expected_struct = %Weather.Forecast.Current{
      daily: [],
      date: "1970-5-30",
      description: "it'sunny",
      precip_prob: 100,
      temperature: 34,
      type: "sun",
      wind: %{bearing: 44, speed: 45}
    }

    assert Current.forecast_from_map(forecast_map) == expected_struct
  end
end
