# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @review = current_user.reviews.build
  end

  def edit; end

  def create
    @review = current_user.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:body)
    end
end
