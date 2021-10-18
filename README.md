# Phoenix Boilerplate

Simple Phoenix Liveview Boilerplate template with the following built in to save you hours of initial project configuration.
  * Liveview
  * AlpineJS
  * Tailwind CSS
  * PhxGenAuth library for Authentication
  * Absinthe library for APIs
  * Bamboo library for emails
  * Waffle library for handling file uploads
  * Kaffy library to save you creating an admin dashboard
  * Wallaby library to help you test your UI
  * Oban library to run background jobs

In the future, I plan to build my own library [`excron`](https://github.com/kchrismucheke/excron) to replace Oban

I've also included the default Github Actions workflow for phoenix to help you run some CI

To start your clone the project then do the following:

  * Install dependencies with `mix deps.get`
  * Copy the `dev.secret.exs.example` to `dev.secret.exs` and add your postgresql user and password
  * Copy the `test.secret.exs.example` to `test.secret.exs` and add your postgresql user and password
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `yarn install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
