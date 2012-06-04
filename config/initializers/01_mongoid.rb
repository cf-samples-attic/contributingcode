Mongoid.configure do |config|
  conn_info = conn_info = {'hostname' => 'localhost', 'port' => 27017}

  cnx = Mongo::Connection.new(conn_info['hostname'], conn_info['port'], :pool_size => 5, :timeout => 5)
  db = cnx['ccmdb']

  config.master = db
end