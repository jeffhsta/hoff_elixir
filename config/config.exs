use Mix.Config

config :crawly,
  closespider_timeout: 10,
  concurrent_requests_per_domain: 1,
  # middlewares: [
  #   {Crawly.Middlewares.UserAgent, user_agents: ["Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1"]}
  # ],
  pipelines: [
    Crawly.Pipelines.JSONEncoder
  ]
