defmodule GenReportTest do
  use ExUnit.Case

  alias GenReport
  alias GenReport.Support.ReportFixture

  @file_name "gen_report.csv"

  describe "build/1" do
    test "When passing file name return a report" do
      response = GenReport.build(@file_name)

      assert response == ReportFixture.build()
    end

    test "When no filename was given, returns an error" do
      response = GenReport.build()

      assert response == {:error, "Insira o nome de um arquivo"}
    end
  end

  describe "build_from_many/1" do
    test "When passing a list of file names return a report" do
      response = GenReport.build(@file_name)

      {:ok, expected_response} =
        GenReport.build_from_many(["part_1.csv", "part_2.csv", "part_3.csv"])

      assert response == expected_response
    end

    test "When no list of file names was given, returns an error" do
      response = GenReport.build_from_many()

      assert response == {:error, "Parameter sent must not be nil"}
    end

    test "When the sent parameter is not and a list, returns an error" do
      response = GenReport.build_from_many("not_a_list")

      assert response == {:error, "Please send a list of string"}
    end
  end
end
