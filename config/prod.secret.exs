use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :shortner, ShortnerWeb.Endpoint,
  secret_key_base: "cvDT7kiIyPi4HoYRemN8gpbMnwk0bXusFW0r80u/h/fkcHSJiDpdjHcfXLoLz/qb"

# Configure your database
config :shortner, Shortner.Repo,
  username: "postgres",
  password: "postgres",
  database: "shortner_prod",
  pool_size: 18
