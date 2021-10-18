# Dont run feature tests by default
# Run wallaby feature tests with `mix test --include feature`
ExUnit.configure(exclude: :feature)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PhoenixBoilerplate.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, PhoenixBoilerplateWeb.Endpoint.url)