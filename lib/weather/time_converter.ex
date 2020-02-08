defmodule TimeConverter do
  def unix_to_datestring(seconds) do
    %DateTime{
      day: day,
      month: month,
      year: year
    } = DateTime.from_unix!(seconds)

    "#{year}-#{month}-#{day}"
  end
end
