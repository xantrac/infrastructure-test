defmodule Weather.Forecast.DailyTest do
  use ExUnit.Case
  alias Weather.Forecast.Daily

  test "generate_daily_forecast, take a list of maps daily forecast and returns a list of Daily structs" do
    daily_list = [
      %{
        "time" => 1_239_087,
        "icon" => "rainy",
        "summary" => "it's rainy",
        "temperatureMin" => 68,
        "temperatureMax" => 80
      },
      %{
        "time" => 4_223_233,
        "icon" => "sunny",
        "summary" => "it's sunny",
        "temperatureMin" => 23,
        "temperatureMax" => 45
      }
    ]

    expected_struct_list = [
      %Weather.Forecast.Daily{
        date: "1970-1-15",
        description: "it's rainy",
        temperature: %{high: 80, low: 68},
        type: "rainy"
      },
      %Weather.Forecast.Daily{
        date: "1970-2-18",
        description: "it's sunny",
        temperature: %{high: 45, low: 23},
        type: "sunny"
      }
    ]

    assert Daily.generate_daily_forecast(daily_list) == expected_struct_list
  end
end
