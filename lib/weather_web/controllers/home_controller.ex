defmodule WeatherWeb.HomeController do
  use WeatherWeb, :controller

  def index(conn, _prams) do
    url = current_url()

    message =
      "Hello, welcome to the weather api, you fetch the next 7 days forecast visting #{url}/weather and providing the desired location coordinates, get started checking the current Atlanta weather #{
        url
      }/weather?latitude=33.7984&longitude=-84.3883"

    text(conn, message)
  end

  def current_url do
    "#{System.get_env("HOST")}:#{System.get_env("PORT")}"
  end
end
