require File.expand_path("../depends.rb", __FILE__)
GemLoader.require(:rakefile)


Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_opts = ['--options', "spec/spec.opts"]
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

namespace :spec do
  Spec::Rake::SpecTask.new(:rcov) do |spec|
    spec.libs << 'lib' << 'spec'
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rcov = true
  end
end


Jeweler::Tasks.new do |spec|
  spec.name = "fume"
  spec.summary = "a simple rails scaffold."
  spec.email = "Sunteya@gmail.com"
  spec.homepage = "http://github.com/sunteya/fume"
  spec.authors = ["Sunteya"]
  GemLoader.gemspec.integrate(spec)
end
Jeweler::GemcutterTasks.new


task :spec => :check_dependencies
task :default => :spec
