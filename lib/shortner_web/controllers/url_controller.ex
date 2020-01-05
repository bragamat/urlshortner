defmodule ShortnerWeb.UrlController do
  use ShortnerWeb, :controller

  alias Shortner.Links.Link
  alias Shortner.Repo
  def index(conn, _params) do
    changeset = Link.changeset(%Link{})
    links = Repo.all(Link)
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"link" => %{"url" => url}}) do
    link = %Link{ url: url, shortned: Link.short_link }
    changeset = Link.changeset(link)
    
    case Repo.insert(changeset) do
      { :ok, link } -> 
        conn
        |> put_flash(:info, "URL encurtada com sucesso\n 
        utilize /#{link.shortned} para redirecionamento")
        |> redirect(to: Routes.url_path(conn, :index))
      { :error, changeset } ->
        render(conn,"index.html", changeset: changeset)
    end
  end

  def show(conn, %{ "url" => url }) do
    case Repo.get_by(Link, shortned: url) do
      :nil -> 
        conn
        |> put_flash(:error, "Url não encontrada")
        |> redirect(to: Routes.url_path(conn, :index))
      link -> redirect(conn, external: Link.check_url(link.url))
    end
  end

end