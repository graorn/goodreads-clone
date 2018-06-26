# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[edit show update destroy favorite]
  before_action :authenticate_user!

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.json {render json: @books}
    end
  end

  def show
    @favorite_exists = FavoriteBook.where(book: @book, user: current_user) != []
    @reviews = @book.reviews

    respond_to do |format|
      format.json {render json: @book}

    end
  end

  def new
    @book = current_user.books.build
  end

  def edit;
  end

  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: "Book was successfully created."}
        format.json {render :show, status: :created, location: @book}
      else
        format.html {render :new}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: "Book was successfully updated."}
        format.json {render :show, status: :ok, location: @book}
      else
        format.html {render :edit}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html {redirect_to books_url, notice: "Book was successfully destroyed."}
      format.json {head :no_content}
    end
  end

  def find_one
    @book = Book.find(params[:book_id])

    respond_to do |format|
      render json: @book

    end
  end

  def search
    index
    render :index
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :description, :rating, :review, :favorite, :to_read)
  end
end
