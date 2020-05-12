# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_seo,
  ecto_repos: [ElixirSeo.Repo]

# Configures the endpoint
config :elixir_seo, ElixirSeoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qEJW7MIK9UcFDPiCErbK7RHxOzSji7tlOMO3cFUnRL9vRF4yaS1bArsc57bqh3Ly",
  render_errors: [view: ElixirSeoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirSeo.PubSub,
  live_view: [signing_salt: "K3RjCyy6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
