defmodule EmployeeConsumer.Repo do
  use Ecto.Repo,
    otp_app: :employee_consumer,
    adapter: Ecto.Adapters.Postgres
end
