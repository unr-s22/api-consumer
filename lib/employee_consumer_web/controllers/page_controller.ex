defmodule EmployeeConsumerWeb.PageController do
  use EmployeeConsumerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
