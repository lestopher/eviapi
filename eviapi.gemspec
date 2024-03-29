Gem::Specification.new do |s|
  s.name         = 'eviapi'
  s.version      = '0.9.5'
  s.date         = '2013-09-18'
  s.summary      = 'Hook into Evisions API'
  s.description  = 'A gem to easily access Evisions\'s API'
  s.authors      = ["Christopher Nguyen"]
  s.email        = "christopher.nguyen@evisions.com"
  s.files        = Dir["lib/**/*.rb"]
  s.homepage     = 'http://github.com/lestopher/eviapi.git'
  s.add_dependency 'json'
  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie'
end
