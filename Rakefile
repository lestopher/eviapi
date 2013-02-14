task :build do
  Dir.glob("*\.gem") do |e|
    File.delete e
  end

 sh 'gem build eviapi.gemspec' 
end

task :install do
  gem_name = Dir.glob("*\.gem")[0]
  sh "gem install #{gem_name}"
end

task :default => [:build, :install]
