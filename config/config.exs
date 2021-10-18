# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phoenix_boilerplate,
  ecto_repos: [PhoenixBoilerplate.Repo]

# Configures the endpoint
config :phoenix_boilerplate, PhoenixBoilerplateWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhoenixBoilerplateWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixBoilerplate.PubSub,
  live_view: [signing_salt: "R9pDsgA+"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :phoenix_boilerplate, PhoenixBoilerplate.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix_boilerplate, PhoenixBoilerplate.Guardian,
  issuer: "phoenix_boilerplate",
  secret_key: "OCuAUz//DpJNEmdKrsQpH380LhftAMOY4WxRSyAQggYGUMXD6EOXC+XjuJZw3bLFdjM=",
  ttl: {3, :days}

config :phoenix_boilerplate, PhoenixBoilerplateWeb.AuthAccessPipeline,
  module: PhoenixBoilerplate.Guardian,
  error_handler: PhoenixBoilerplateWeb.AuthErrorHandler

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :phoenix_boilerplate, PhoenixBoilerplate.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :phoenix_boilerplate,
   ecto_repo: PhoenixBoilerplate.Repo,
   router: PhoenixBoilerplateWeb.Router

config :phoenix_boilerplate, Oban,
  repo: PhoenixBoilerplate.Repo,
  queues: [default: 10, mailers: 20, events: 50, low: 5],
  plugins: [
    Oban.Plugins.Pruner,
    {Oban.Plugins.Cron,
     crontab: [
       {"0 8 * * *", PhoenixBoilerplate.Workers.ExampleWorker},
     ]}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
