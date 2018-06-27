# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReviewsController, type: :controller do

  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      review = Review.create
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :show, params: { id: review.to_param }
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :edit, params: { id: review.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect do
          post :create, params: { review: valid_attributes }
        end.to change(Review, :count).by(1)
      end

      it "redirects to the created review" do
        post :create, params: { review: valid_attributes }
        expect(response).to redirect_to(Review.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { review: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested review" do
        review = Review.create! valid_attributes
        put :update, params: { id: review.to_param, review: new_attributes }
        review.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, params: { id: review.to_param, review: valid_attributes }
        expect(response).to redirect_to(review)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        review = Review.create! valid_attributes
        put :update, params: { id: review.to_param, review: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect do
        delete :destroy, params: { id: review.to_param }
      end.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, params: { id: review.to_param }
      expect(response).to redirect_to(reviews_url)
    end
  end
end
