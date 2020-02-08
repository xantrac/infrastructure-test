defmodule Forecast do
  defstruct date: nil,
            type: nil,
            description: nil,
            temperature: nil,
            wind: nil,
            precip_prob: nil,
            daily: []

  def create_forecast_from_request(%{"currently" => %{"time" => time, "icon" => type}}) do
    %__MODULE__{}
  end
end
