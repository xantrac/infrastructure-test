defmodule Weather.Forecast.DailyTest do
  use ExUnit.Case
  alias Weather.Forecast.Daily

  test "generate_daily_forecast, take a list of maps daily forecast and returns a list of Daily structs excluding the current day" do
    daily_list = [
      %{
        "time" => 4_223_233,
        "icon" => "rainy",
        "summary" => "it's rainy",
        "temperatureMin" => 68,
        "temperatureMax" => 80
      },
      %{
        "time" => 30_459_558,
        "icon" => "sunny",
        "summary" => "it's sunny",
        "temperatureMin" => 23,
        "temperatureMax" => 45
      },
      %{
        "time" => 2_345_598,
        "icon" => "sunny",
        "summary" => "it's sunny",
        "temperatureMin" => 23,
        "temperatureMax" => 45
      }
    ]

    expected_struct_list = [
      %Weather.Forecast.Daily{
        date: "1970-12-19",
        description: "it's sunny",
        temperature: %{high: 45, low: 23},
        type: "sunny"
      },
      %Weather.Forecast.Daily{
        date: "1970-1-28",
        description: "it's sunny",
        temperature: %{high: 45, low: 23},
        type: "sunny"
      }
    ]

    assert Daily.generate_daily_forecast(daily_list, "1970-2-18") == expected_struct_list
  end
end
