require "active_record"

config = Apartment::Test.config['connections']["postgresql"]
ActiveRecord::Base.establish_connection(config)
