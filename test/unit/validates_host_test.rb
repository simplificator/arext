require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ValidatesHostTest < Test::Unit::TestCase
  VALID_HOSTS = ['simplificator.com', 'www.hallo.com', 'hallo-velo.ch', 'www.hallo-velo.ch', 
                  '1.1.1.1', '255.255.255.255']
  INVALID_HOSTS = ['', '.2.3.4', 'http://www.google.ch', '10.10.10.10:3000', 'google', '10.10.10.10.']
  
  def setup()
    Foo.send(:validates_host, :host)
  end
  def test_valid_host_formats
    
    VALID_HOSTS.each do |host|
      foo = Foo.new(:host => host)
      foo.valid?
      assert(foo.errors[:host].blank?, "Host '#{host}' is supposed to be valid")
    end
  end
  
  def test_invalid_host_formats
    INVALID_HOSTS.each do |host|
      foo = Foo.new(:host => host)
      foo.valid?
      assert(foo.errors[:host], "Host '#{host}' is supposed to be invalid")
    end
  end
end
