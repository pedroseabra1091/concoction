import Config

config :concoction, Concoction.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    Environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :concoction, ConcoctionWeb.Endpoint,
  http: [:inet6, port: 4000],
  secret_key_base: secret_key_base
