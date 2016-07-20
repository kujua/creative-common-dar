# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dar_api,
  ecto_repos: [DarApi.Repo]

# Configures the endpoint
config :dar_api, DarApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M3V7BfK9+8G+/GE8o3Q3FsVx4xCsXF9Pqnx0EIks0mUs94Yg3TRFjNoe/qKbpXbU",
  render_errors: [view: DarApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DarApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
