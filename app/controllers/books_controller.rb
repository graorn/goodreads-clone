# frozen_string_literal: true

# # frozen_string_literal: true
#
class BooksController < ApplicationController
  before_action :set_book,
                only: %i[edit show update destroy favorite place_book_to_reading_list]
  before_action :authenticate_user!

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @reviews = @book.reviews.order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { redirect_to new_book_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  def find_one
    @book = Book.find(params[:book_id])
    render json: @book
  end

  def search
    index
    render :index
  end

  def favorite
    unless current_user.favorited? @book
      return current_user.favorite @book
    end

    current_user.remove_favorite @book
  end

  def place_book_to_reading_list
    @list = ReadingList.new(book: @book, user: current_user)

    if @list.save
      redirect_to @book, notice: 'Book is placed in a reading list'
    else
      redirect_to @book, notice: 'Book is not placed in a reading list'
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(
        :title, :author, :genre, :description)
    end
end
