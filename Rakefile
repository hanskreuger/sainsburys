require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen/rake_tasks'
require 'rspec/core/rake_task'

desc 'Run style & lint checks'
task style: [:rubocop, :foodcritic]

task default: [:style, :build, :integration]

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
    sh 'kitchen converge pensive-landscape-4090'
    sh 'kitchen converge thrashing-volcano-2002'
  end
  desc 'converge web node'
  task :web do
    sh 'kitchen converge silent-moonlight-1203'
  end
  task :all do
    sh 'kitchen converge pensive-landscape-4090'
    sh 'kitchen converge thrashing-volcano-2002'
    sh 'kitchen converge silent-moonlight-1203'
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
    sh 'kitchen destroy pensive-landscape-4090'
    sh 'kitchen destroy thrashing-volcano-2002'
  end
  desc 'destroy web node'
  task :web do
    sh 'kitchen destroy silent-moonlight-1203'
  end
  task :all do
    sh 'kitchen destroy'
  end
end