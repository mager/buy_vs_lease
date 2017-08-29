# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :buy_vs_lease,
  ecto_repos: [BuyVsLease.Repo]

# Configures the endpoint
config :buy_vs_lease, BuyVsLeaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8G6zz3ke6tv23dk74bQ7CYPkojnZCRcGBLQdAXLUtw2abiQqwukMLn+QflUiBQ2h",
  render_errors: [view: BuyVsLeaseWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BuyVsLease.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
