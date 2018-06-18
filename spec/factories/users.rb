# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    confirmed_at Time.now
  end
end
