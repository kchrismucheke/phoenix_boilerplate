import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_boilerplate, PhoenixBoilerplateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "jO/W+G/Qx2j1vaL3e08mem3yYnkgOD2lRNuZaK4/cT17Ehpo5rrUoOGigq5RjxOu",
  server: true

# In test we don't send emails.
config :phoenix_boilerplate, PhoenixBoilerplate.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_boilerplate, PhoenixBoilerplate.Mailer,
  adapter: Bamboo.TestAdapter

# Dont run oban in tests
config :phoenix_boilerplate, Oban, queues: false, plugins: false
config :wallaby, otp_app: :phoenix_boilerplate
config :phoenix_boilerplate, :sandbox, Ecto.Adapters.SQL.Sandbox

# Import Database config
import_config "test.secret.exs"
