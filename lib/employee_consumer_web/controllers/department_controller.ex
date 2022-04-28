defmodule EmployeeConsumerWeb.DepartmentController do
  use EmployeeConsumerWeb, :controller

  alias EmployeeConsumer.HumanResources
  alias EmployeeConsumer.HumanResources.Department

  def index(conn, _params) do
    departments = HumanResources.list_departments()
    render(conn, "index.html", departments: departments)
  end

  def new(conn, _params) do
    changeset = HumanResources.change_department(%Department{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    case HumanResources.create_department(department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department created successfully.")
        |> redirect(to: Routes.department_path(conn, :show, department))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = HumanResources.get_department_with_employees(id)
    render(conn, "show.html", department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = HumanResources.get_department!(id)
    changeset = HumanResources.change_department(department)
    render(conn, "edit.html", department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = HumanResources.get_department!(id)

    case HumanResources.update_department(department, department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department updated successfully.")
        |> redirect(to: Routes.department_path(conn, :show, department))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = HumanResources.get_department!(id)
    {:ok, _department} = HumanResources.delete_department(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: Routes.department_path(conn, :index))
  end
end
