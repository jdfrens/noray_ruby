# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task all_tests: %i[rubocop spec steep]

task :rubocop do
  sh 'rubocop --require rubocop-rspec'
end

task :steep do
  sh 'steep check'
end
