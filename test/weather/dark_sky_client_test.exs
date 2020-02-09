defmodule Weather.DarkSkyClientTest do
  use ExUnit.Case
  import Mock
  alias Weather.DarkSkyClient

  setup_all do
    System.put_env("DARK_SKY_KEY", "banana")
  end

  test "get_forecast returns a json decoded response with the curren forecast" do
    get_mock = fn "https://api.darksky.net/forecast/banana/55,55",
                  _headers,
                  params: %{exclude: "minutely, hourly, alerts, flags"} ->
      {:ok,
       %HTTPoison.Response{
         body: "{\"some value\" : \"some key\"}",
         status_code: 200
       }}
    end

    Mock.with_mock HTTPoison, get: get_mock do
      assert DarkSkyClient.get_forecast({55, 55}) == {:ok, %{"some value" => "some key"}}
    end
  end

  test "get_forecast, with bad parameters, returns a json decoded error" do
    get_mock = fn "https://api.darksky.net/forecast/banana/55,banana",
                  _headers,
                  params: %{exclude: "minutely, hourly, alerts, flags"} ->
      {:ok,
       %HTTPoison.Response{
         body: "{\"error_key\" : \"error_message\"}",
         status_code: 400
       }}
    end

    Mock.with_mock HTTPoison, get: get_mock do
      assert DarkSkyClient.get_forecast({55, "banana"}) ==
               {:error, %{"error_key" => "error_message"}}
    end
  end
end
