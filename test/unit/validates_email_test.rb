require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ValidatesEmailTest < Test::Unit::TestCase
  VALID_ADDRESSES = ['vorname.nachmane@gmail.com', 'vorname.nachname@gmail.ch', 'name@gmail.com', 
                    'vorname-nachname@test-ch.net', 'vorname_nachname@gmail.org', 'name@gmail.name',
                    'joesmith.nospamplease@nospam.example.com', 'test77@t-online.ch'
  ]
  
  INVALID_ADDRESSES = ['vorname.gmail.com', 'vorname%nachmane@gmail.com', 'test@gmail.1',
                      'vorname', 'vorname.nachname', '', 'vorname,nachmane@schweiz.ch'
  ]
  
  def setup()
    Foo.send(:validates_email, :email)
  end
  
  def test_valid_email_formats
    
    VALID_ADDRESSES.each do |email|
      foo = Foo.new(:email => email)
      foo.valid?
      assert(foo.errors[:email].blank?, "eMail-Address '#{email}' is supposed to be valid")
    end
  end
  
  def test_invalid_email_formats
    INVALID_ADDRESSES.each do |email|
      foo = Foo.new(:email => email)
      foo.valid?
      assert(foo.errors[:email], "eMail-Address '#{email}' is supposed to be invalid")
    end
  end
end
