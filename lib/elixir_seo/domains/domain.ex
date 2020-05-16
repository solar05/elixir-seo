defmodule ElixirSeo.Domains.Domain do
  use Ecto.Schema
  import Ecto.Changeset

  schema "domains" do
    field :content, :string
    field :header, :string
    field :length, :integer
    field :name, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(domain, attrs) do
    domain
    |> cast(attrs, [:name, :state, :length, :content, :header])
    |> validate_required([:name])
  end
end
