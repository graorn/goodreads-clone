# frozen_string_literal: true

json.extract! review, :id, :reviewer, :text, :created_at, :updated_at
json.url review_url(review, format: :json)