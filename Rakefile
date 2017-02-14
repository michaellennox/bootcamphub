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
  task build: :environment do
    destination = Hanami.root.join('public', 'guides')
    guides_root = Hanami.root.join('apps', 'guides')

    options = {
      'config' => guides_root.join('_config.yml').to_s,
      'source' => guides_root.to_s,
      'destination' => destination.to_s
    }

    Jekyll::Commands::Build.process(options)
  end
end
