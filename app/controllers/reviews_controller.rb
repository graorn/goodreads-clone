# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])

    @review = Review.new(
      reviewable_id: params[:book_id],
      reviewable_type: "Book",
      reviewer_type: "User",
      reviewer_id: current_user.id,
      body: params[:review][:body],
      rating: params[:review][:rating],)

    if @review.save
      redirect_to book_path(@book), notice: "Created review"
    else
      redirect_to book_path(@book), notice: "Cannot create review"
    end
  end
end
