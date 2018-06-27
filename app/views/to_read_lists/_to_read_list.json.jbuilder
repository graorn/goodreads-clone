# frozen_string_literal: true

json.extract! to_read_list, :id, :user_id, :book_id, :created_at, :updated_at
json.url to_read_list_url(to_read_list, format: :json)
