defmodule EmployeeConsumer.HumanResourcesTest do
  use EmployeeConsumer.DataCase

  alias EmployeeConsumer.HumanResources

  describe "departments" do
    alias EmployeeConsumer.HumanResources.Department

    import EmployeeConsumer.HumanResourcesFixtures

    @invalid_attrs %{name: nil}

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert HumanResources.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert HumanResources.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Department{} = department} = HumanResources.create_department(valid_attrs)
      assert department.name == "some name"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HumanResources.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Department{} = department} = HumanResources.update_department(department, update_attrs)
      assert department.name == "some updated name"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = HumanResources.update_department(department, @invalid_attrs)
      assert department == HumanResources.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = HumanResources.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> HumanResources.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = HumanResources.change_department(department)
    end
  end
end
