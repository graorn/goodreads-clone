# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review


  def index
  end

  def show
  end

  def new
    @review = Review.new
  end


  def edit
  end

  def create
    # require 'byebug'; byebug
    @review = Review.new(user: current_user, book: @book, body: params[:review][:body])


    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
      else

        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_review
      @reviews = Review.where(book: @book)
    end

    def review_params
      params.require(:review).permit(:body, :book, :user)
    end
end
