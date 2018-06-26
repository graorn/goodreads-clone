# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy favorite]


  def index
    @book = Book.find(params[:book_id])
    @reviews = Review.where(book: @book)
  end

  def show
  end

  def new
    @review = Review.new
  end


  def edit;
  end

  def create

    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        redirect_to root_path, notice: "Book was successfully created."
      else
        format.html {render :new}
      end
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body, :book)
  end
end
