defmodule ShortnerWeb.UrlController do
  use ShortnerWeb, :controller

  alias Shortner.Links.Links
  alias Shortner.Repo
  def index(conn, _params) do
    changeset = Links.changeset(%Links{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"links" => %{"url" => url}}) do
    link = %Links{ url: url, shortned: Links.short_link }
    changeset = Links.changeset(link)
    
    case Repo.insert(changeset) do
      { :ok, _struct } -> 
        conn
        |> put_flash(:info, "URL encurtada com sucesso")
        |> redirect(to: Routes.url_path(conn, :index))
      { :error, changeset } ->
        render(conn,"index.html", changeset: changeset)
    end
  end

  def show(conn, %{ "url" => url }) do
    case Repo.get_by(Shortner.Links.Links, shortned: url) do
      :nil -> 
        conn
        |> put_flash(:error, "Url não encontrada")
        |> redirect(to: Routes.url_path(conn, :index))
      link -> 
        # link.url |> url = Shortner.Links.Links.check_url
        redirect(conn, external: Links.check_url(link.url))
    end
  end

end