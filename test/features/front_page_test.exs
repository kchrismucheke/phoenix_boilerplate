defmodule PhoenixBoilerplate.Features.FrontPageTest do
  use ExUnit.Case
  use Wallaby.Feature

  import Wallaby.Query

  feature "users can create an account", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".title-font", text: "Welcome to Phoenix!"))
  end
end