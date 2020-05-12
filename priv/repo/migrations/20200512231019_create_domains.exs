defmodule ElixirSeo.Repo.Migrations.CreateDomains do
  use Ecto.Migration

  def change do
    create table(:domains) do
      add :name, :string
      add :state, :string
      add :length, :integer
      add :content, :string
      add :header, :string

      timestamps()
    end

  end
end
