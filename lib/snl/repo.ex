defmodule Snl.Repo do
  use Ecto.Repo,
    otp_app: :snl,
    adapter: Ecto.Adapters.Postgres
end
