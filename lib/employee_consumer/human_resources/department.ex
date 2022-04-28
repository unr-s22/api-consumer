defmodule EmployeeConsumer.HumanResources.Department do
  use Ecto.Schema
  import Ecto.Changeset
  alias EmployeeConsumer.HumanResources.Employee

  schema "departments" do
    field :name, :string
    field :uid, :integer
    # has_many :employees, Employee
    timestamps()
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
