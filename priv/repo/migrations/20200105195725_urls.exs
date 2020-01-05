defmodule Shortner.Repo.Migrations.Urls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string
      add :shortned, :string
    end
  end
end
