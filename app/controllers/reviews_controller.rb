# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])

    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user


    if @review.save
      redirect_to book_path(@book), notice: 'Created review'
    else
      redirect_to new_book_review_path, notice: 'Unable to create a review'
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating)
    end
end
