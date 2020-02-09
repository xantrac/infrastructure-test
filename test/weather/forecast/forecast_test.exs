defmodule Weather.Forecast.ForecastTest do
  use ExUnit.Case
  alias Weather.Forecast.Forecast

  test "generate_forecast, takes a decoded response from Dark Sky Api and returns a Weather response" do
    dark_sky_payload = %{
      "currently" => %{
        "time" => 12_897_986,
        "icon" => "sun",
        "summary" => "it'sunny",
        "temperature" => 34,
        "windSpeed" => 45,
        "windBearing" => 44,
        "precipProbability" => 100
      },
      "daily" => %{
        "data" => [
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
      }
    }

    expected_response = %Weather.Forecast.Current{
      daily: [
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
      ],
      date: "1970-5-30",
      description: "it'sunny",
      precip_prob: 100,
      temperature: 34,
      type: "sun",
      wind: %{bearing: 44, speed: 45}
    }

    assert Forecast.generate_forecast(dark_sky_payload) == expected_response
  end
end
