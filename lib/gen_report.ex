defmodule GenReport do
  alias GenReport.InicialAcc
  alias GenReport.Parser

  def build(filename) when is_binary(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(InicialAcc.acc(), fn one_line, report -> sum_hours_all(one_line, report) end)
  end

  def build, do: {:error, "Insira o nome de um arquivo"}

  defp sum_hours_all(
         [name, hour, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         } = report
       ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hour)

    hours_per_month =
      Map.put(
        hours_per_month,
        name,
        sun_month_or_year(hours_per_month[name], month, hour)
      )

    hours_per_year =
      Map.put(
        hours_per_year,
        name,
        sun_month_or_year(hours_per_year[name], year, hour)
      )

    report
    |> Map.put("all_hours", all_hours)
    |> Map.put("hours_per_month", hours_per_month)
    |> Map.put("hours_per_year", hours_per_year)
  end

  defp sun_month_or_year(name_freela, month_or_year, hour) do
    Map.put(name_freela, month_or_year, name_freela[month_or_year] + hour)
  end
end
