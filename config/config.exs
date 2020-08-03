# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :student,
  ecto_repos: [Student.Repo]

# Configures the endpoint
config :student, StudentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XkBhg9g5juWYg79kIxlyqHWv5h+Dwe51K6Hqe5LEJI82RMnANVWEEqwJyK5FI8Mn",
  render_errors: [view: StudentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Student.PubSub,
  live_view: [signing_salt: "j29jz39x"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
