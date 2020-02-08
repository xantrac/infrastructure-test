defmodule Forecast do
  defstruct date: nil,
            type: nil,
            description: nil,
            temperature: nil,
            wind: nil,
            precip_prob: nil,
            daily: []

  def create_forecast_from_request(%{"time" => time, "icon" => type, "summary" => summary, "temperature" => temperature, "windBearing" => windBearing, "windGust" => windGust, "precipProbability" => precipProbability}}) do
    %__MODULE__{}
  end
end
