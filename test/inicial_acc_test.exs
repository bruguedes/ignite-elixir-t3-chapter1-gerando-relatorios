defmodule GenReport.InicialAccTest do
  use ExUnit.Case

  alias GenReport.InicialAcc

  describe "acc/1" do
    test "Create map for accumulator" do
      # file_name = "gen_report.csv"

      response = InicialAcc.acc()

      assert %{
               "all_hours" => _,
               "hours_per_month" => %{
                 "cleiton" => _,
                 "daniele" => _,
                 "danilo" => _,
                 "diego" => _,
                 "giuliano" => _,
                 "jakeliny" => _,
                 "joseph" => _,
                 "mayk" => _,
                 "rafael" => _,
                 "vinicius" => _
               },
               "hours_per_year" => %{
                 "cleiton" => _,
                 "daniele" => _,
                 "danilo" => _,
                 "diego" => _,
                 "giuliano" => _,
                 "jakeliny" => _,
                 "joseph" => _,
                 "mayk" => _,
                 "rafael" => _,
                 "vinicius" => _
               }
             } = response
    end
  end
end
