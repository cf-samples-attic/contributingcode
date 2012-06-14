CarrierWave.configure do |config|

  config.grid_fs_database = ENV['mongodb_db']
  config.grid_fs_host = ENV['mongodb_host']
  config.grid_fs_port = ENV['mongodb_port']
  config.grid_fs_username = ENV['mongodb_username']
  config.grid_fs_password = ENV['mongodb_password']
  config.grid_fs_access_url = "/grid"
end