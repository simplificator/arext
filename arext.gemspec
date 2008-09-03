Gem::Specification.new do |s|
  s.name = %q{arext}
  s.version = "0.2.8"
  s.date = %q{2008-09-03}
  s.authors = ["Simplificator GmbH"]
  s.email = %q{info@simplificator.com}
  s.summary = %q{provieds some extensions to ActiveRecord}
  s.homepage = %q{http://simplificator.com/en/lab}
  s.description = %q{Adds some new validations to AR.}
  s.files = ["init.rb", "lib/arext.rb", "lib/arext/validations.rb", "README"]
  # can not use this on github...
  #s.files = Dir['lib/**/*.rb'] + Dir['test/**/*']
  #s.files << ['README', 'init.rb']
  #s.files.reject! { |fn| fn.include? "nbproject" }
end
