require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end

namespace :guides do

  desc 'builds the guides site from source'
  task :build do
    require 'jekyll'
    
    project_root = Pathname.new(__dir__)
    destination = project_root.join('public', 'guides')
    guides_root = project_root.join('apps', 'guides')

    options = {
      'config' => guides_root.join('_config.yml').to_s,
      'source' => guides_root.to_s,
      'destination' => destination.to_s
    }

    Jekyll::Commands::Build.process(options)
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["guides:build"].invoke
end
