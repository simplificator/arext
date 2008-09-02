require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ValidatesConstraintsTest < Test::Unit::TestCase
  VALID_URLS = ['http://simplificator.com', 'http://www.simplificator.com', 'https://www.simplificator.com', 
                'https://simplificator.com', 'https://simplificator.com:3333', 'http://10.10.10.10', 
                'https://10.10.10.10:1234', 'http://255.255.255.255:1212/test', 'http://a-b.com']
  INVALID_URLS = ['http.//www.uptimehq.com', 'https.//google.com', 'http://simplificator.c', 'www.google.com']
  
  def setup()
    Foo.send(:validates_url, :url)
  end
  def test_valid_url_formats
    
    VALID_URLS.each do |url|
      foo = Foo.new(:url => url)
      assert(foo.valid?, "URL #{url} is supposed to be valid")
    end
  end
  
  def test_invalid_url_formats
    INVALID_URLS.each do |url|
      foo = Foo.new(:url => url)
      assert(!foo.valid?, "URL #{url} is supposed to be invalid")
    end
  end
end
