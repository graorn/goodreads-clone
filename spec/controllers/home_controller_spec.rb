# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeController do
  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe "GET #index" do
    it "returns status ok" do
       get :index

       expect(response).to have_http_status(:ok)
     end

    it "renders index view" do
      get :index

      expect(response).to render_template(:index)
    end
  end
end
