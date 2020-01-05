defmodule ShortnerWeb.PageController do
  use ShortnerWeb, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: Routes.url_path(conn, :index))
  end
end
