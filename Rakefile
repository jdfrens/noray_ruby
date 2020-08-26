# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task all_tests: %i[rubocop spec]

task :rubocop do
  sh 'rubocop'
end
