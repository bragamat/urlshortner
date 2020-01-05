defmodule Shortner.Links.Links do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :url, :string
    field :shortned, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :shortned])
    |> validate_required([:url])
  end

  def short_link(length \\ 6)do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64
    |> binary_part(0, length)
  end

  def check_url(url) do
    case String.contains?("https://", url) do
      true -> url
      false -> "http://" <> url
    end
  end
end