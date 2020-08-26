# frozen_string_literal: true

target :lib do
  signature 'sig'
  check 'lib'
end

target :spec do
  signature 'sig', 'sig-private'

  check 'spec'

  library 'rspec'
end
