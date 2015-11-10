require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen/rake_tasks'
require 'rspec/core/rake_task'

desc 'Run style & lint checks'
task style: [:rubocop, :foodcritic]

task default: [:style, :build, :verify, :integration]

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# Foodcritic
desc 'Run foodcritic lint checks'
task :foodcritic do
  FoodCritic::Rake::LintTask.new do |t|
    t.options = { fail_tags: ['correctness'] }
  end
end

# Kitchen-ci
desc 'build everything'
task build: 'build:all'

namespace :build do
  desc 'converge app nodes'
  task :app do
    sh 'kitchen converge app'
  end
  desc 'converge web node'
  task :web do
    sh 'kitchen converge web'
  end
  task :all do
    sh 'kitchen converge app'
    sh 'kitchen converge web'
  end
end

desc 'verify everything'
task verify: 'verify:all'

namespace :verify do
  desc 'verify app nodes'
  task :app do
    sh 'kitchen verify app'
  end
  desc 'verify web node'
  task :web do
    sh 'kitchen verify web'
  end
  task :all do
    sh 'kitchen verify'
  end
end

# Rspec / Infrataster
RSpec::Core::RakeTask.new(:integration) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
  # t.rspec_opts << ' more options'
end

# Cleanup
desc 'destroy everything'
task destroy: 'destroy:all'

namespace :destroy do
  desc 'destroy app nodes'
  task :app do
    sh 'kitchen destroy app'
  end
  desc 'destroy web node'
  task :web do
    sh 'kitchen destroy web'
  end
  task :all do
    sh 'kitchen destroy'
  end
end
