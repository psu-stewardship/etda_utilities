# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
ENV['PARTNER'] = ENV.fetch('PARTNER', 'graduate')

require "bundler/setup"
require "etda_utilities"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def partner_set_env(this_partner)
    ENV['PARTNER'] = this_partner
  end
end
