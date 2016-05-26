# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :darapi,
  ecto_repos: [Darapi.Repo]

# Configures the endpoint
config :darapi, Darapi.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "HZq0+JMiGV7czWxjuVrmRoNrJiIx9oIQ58B+MrXhzdVoDsmL1k6/XG0BaY5AlEg0",
  render_errors: [view: Darapi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Darapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
