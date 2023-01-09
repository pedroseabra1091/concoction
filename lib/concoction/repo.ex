defmodule Concoction.Repo do
  use Ecto.Repo,
    otp_app: :concoction,
    adapter: Ecto.Adapters.Postgres
end
