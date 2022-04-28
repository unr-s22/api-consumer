defmodule EmployeeConsumer.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string
      add :uid, :integer
      timestamps()
    end
  end
end
