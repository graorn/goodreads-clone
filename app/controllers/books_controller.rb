# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy favorite]
  before_action :authenticate_user!

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def show; end

  def new
    @book = current_user.books.build
  end

  def edit; end

  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    index
    render :index
  end

  def favorite
    if params[:favorite] == 'yes'
      FavoriteBook.create(user_id: current_user.id, book_id: @book.id, favorite: true)
    else
      FavoriteBook.update(user_id: current_user.id, book_id: @book.id, favorite: false)
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :description, :rating, :review, :favorite, :to_read)
  end
end
