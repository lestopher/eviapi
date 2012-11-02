Gem::Specification.new do |s|
  s.name         = 'eviapi'
  s.version      = '0.0.0'
  s.date         = '2012-11-01'
  s.summary      = 'Hook into Evisions API'
  s.description  = 'A gem to easily access Evisions\'s API'
  s.authors      = ["Christopher Nguyen"]
  s.email        = "christopher.nguyen@evisions.com"
  s.files        = ["lib/eviapi.rb"]
  s.homepage     = 'http://github.com/chr1sst0pher/eviapi.git'
  s.add_dependency 'json'
  s.add_dependency 'faraday'
end
