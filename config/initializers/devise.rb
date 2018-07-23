# frozen_string_literal: true

Devise.setup do |config|

  config.stretches = Rails.env.test? ? 1 : 10

  config.omniauth :facebook, "310718592799413", "83282b9661749ca6baca5b78630e35a7"

  config.secret_key = "6e3d8e30df73d7805b958d0df88d7b4c1daa8beef7e48f1765a1e03dc671a2f0342f522a354c1e060f381c90a28c6065f25caf1939254e391fae22e618bfcf0f"
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
