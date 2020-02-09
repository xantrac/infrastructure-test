defmodule Weather.DarkSkyClient do
  @spec get_forecast({any, any}) :: any
  def get_forecast({latitude, longitude}) do
    {:ok, request} = perform_request({latitude, longitude})

    case request.status_code do
      200 -> {:ok, Jason.decode!(request.body)}
      _ -> {:error, Jason.decode!(request.body)}
    end
  end

  def perform_request({latitude, longitude}) do
    compose_url({latitude, longitude})
    |> HTTPoison.get([],
      params: %{exclude: "minutely, hourly, alerts, flags"}
    )
  end

  defp compose_url({latitude, longitude}) do
    "#{base_url()}/#{dark_sky_key()}/#{latitude},#{longitude}"
  end

  defp base_url do
    "https://api.darksky.net/forecast"
  end

  defp dark_sky_key do
    System.fetch_env!("DARK_SKY_KEY")
  end
end
