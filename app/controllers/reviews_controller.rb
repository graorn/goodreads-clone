# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_book, only: %i[new create edit update destroy]

  def new
    @review = Review.new

    authorize @review
  end

  def create
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

  def edit
    @review = Review.find(params[:id])

    authorize @review
  end

  def update
    @review = policy_scope(Review).find(params[:id])

    authorize @review

    if @review.update(review_params)
      redirect_to @book, notice: 'Review updated'
    else
      render :edit, notice: 'Review update failed'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])

    @review = Review.find(params[:id])
    authorize @review, :destroy?, policy_class: ReviewPolicy

    if @review.delete
      redirect_to @book, notice: 'Deleted review'
    end
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :rating)
    end
end
