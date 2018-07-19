# frozen_string_literal: true

require 'support/helpers/session_helpers'
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
