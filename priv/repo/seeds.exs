# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EmployeeConsumer.Repo.insert!(%EmployeeConsumer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias EmployeeConsumer.HumanResources.Department
alias EmployeeConsumer.Repo

dept = %Department{name: "HouseWares", uid: 1}
Repo.insert(dept)
dept = %Department{name: "Food", uid: 2}
Repo.insert(dept)
dept = %Department{name: "Garden", uid: 3}
Repo.insert(dept)
dept = %Department{name: "Clothing", uid: 4}
Repo.insert(dept)
