# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{arext}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["simplificator"]
  s.date = %q{2009-05-28}
  s.email = %q{info@simplificator.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/arext.rb",
    "lib/arext/validations.rb",
    "test/foo.rb",
    "test/test_helper.rb",
    "test/unit/validates_constraints_test.rb",
    "test/unit/validates_email_test.rb",
    "test/unit/validates_host_test.rb",
    "test/unit/validates_url_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/simplificator/arext}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Adds new validations to AR}
  s.test_files = [
    "test/foo.rb",
    "test/test_helper.rb",
    "test/unit/validates_constraints_test.rb",
    "test/unit/validates_email_test.rb",
    "test/unit/validates_host_test.rb",
    "test/unit/validates_url_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
