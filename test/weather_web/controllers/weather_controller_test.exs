defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET /weather", %{conn: conn} do
    test "it return the the current and weekly forecast" do
      conn = get(conn, "/")
      assert json_response(conn, 200) == %{"foo" => "bar"}
    end
  end
end
