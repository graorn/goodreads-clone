# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])

    authorize @review
  end

  def create
    @book = Book.find(params[:book_id])

    @review = Review.new(review_params)

    @review.book = @book
    @review.user = current_user

    authorize @review


    if @review.save
      redirect_to book_path(@book), notice: 'Created review'
    else
      redirect_to new_book_review_path, notice: 'Unable to create a review'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review, :destroy?, policy_class: ReviewPolicy

    if @review.delete
      redirect_to @book, notice: 'Deleted review'
    end
  end

  private

    def review_params
      params.require(:review).permit(:title, :content, :rating)
    end
end
