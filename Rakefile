task :build do
 sh 'gem build eviapi.gemspec' 
end

task :clean do
  Dir.glob("*\.gem") do |e|
    File.delete e
  end
end

task :install do
  gem_name = Dir.glob("*\.gem")[0]
  sh "gem install #{gem_name}"
end

task :default => [:clean, :build, :install]
