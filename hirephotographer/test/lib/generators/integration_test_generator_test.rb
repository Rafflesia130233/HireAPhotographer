require 'test_helper'
require 'generators/integration_test/integration_test_generator'

class IntegrationTestGeneratorTest < Rails::Generators::TestCase
  tests IntegrationTestGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
