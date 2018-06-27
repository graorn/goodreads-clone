# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ToReadLists", type: :request do
  describe "GET /to_read_lists" do
    it "works! (now write some real specs)" do
      get to_read_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
