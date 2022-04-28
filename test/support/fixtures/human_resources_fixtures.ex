defmodule EmployeeConsumer.HumanResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EmployeeConsumer.HumanResources` context.
  """

  @doc """
  Generate a department.
  """
  def department_fixture(attrs \\ %{}) do
    {:ok, department} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> EmployeeConsumer.HumanResources.create_department()

    department
  end
end
