defmodule EmployeeConsumer.HumanResources.Employee do
  defstruct last_name: nil, first_name: nil, employee_number: nil, department: nil

  @url "http://localhost:3000/api/employees"

  def get_by_department(department) do
    {:ok, response} = HTTPoison.get(@url <> "/departments/#{department.uid}")
    {:ok, values} = Jason.decode(response.body)
    values
  end
end
