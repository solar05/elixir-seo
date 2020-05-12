defmodule ElixirSeo.Repo do
  use Ecto.Repo,
    otp_app: :elixir_seo,
    adapter: Ecto.Adapters.Postgres
end
