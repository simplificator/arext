require 'rubygems'
require 'active_record'
require 'test/unit'

require File.join(File.dirname(__FILE__), '..', 'init')


ActiveRecord::Base.establish_connection(  
  :adapter  => 'sqlite3',   
  :database => 'test.sqlite3',   
  :timeout => 5000
)

begin
  ActiveRecord::Base.connection.drop_table(:foos)
rescue
  # no such table
end

ActiveRecord::Base.connection.create_table(:foos) do |table|
  table.string(:not_null_string_with_limit, :null => false, :limit => 10)
  table.string(:string_with_limit, :null => true, :limit => 20)
  table.string(:null_string_without_limit, :null => true)
  table.boolean(:null_boolean)
  table.boolean(:not_null_boolean, :null => false)
  table.integer(:null_integer, :null => true)
  table.integer(:not_null_integer, :null => false)
  table.float(:null_float, :null => true)
  table.float(:not_null_float, :null => false)
  
  table.string(:url)
  table.string(:host)
end

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = Logger::DEBUG # change to DEBUG if you want to see something :-)

require File.join(File.dirname(__FILE__), 'foo')