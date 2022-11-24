CarrierWave.configure do |config|
  # 変更前
  # config.asset_host = "http://localhost:8080"
  # 変更後
  config.asset_host = "https://restless-glitter-6164.fly.dev/"
  config.storage = :file
  config.cache_storage = :file
end