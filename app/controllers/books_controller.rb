# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book,
                only: %i[edit show update destroy favorite unfavorite place_book_to_reading_list remove_from_reading_list]
  before_action :authenticate_user!


  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

    authorize Book
  end

  def show
    @reviews = @book.reviews.order('created_at DESC')
    authorize @book
    authorize @reviews
  end

  def new
    @book = Book.new
    authorize @book
  end

  def edit
    authorize Book
  end

  def create
    @book = Book.new(book_params)
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { redirect_to new_book_path }
      end
    end
  end

  def update
    authorize @book

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @book

    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully deleted.' }
    end
  end

  def find_one
    @book = Book.find(params[:book_id])
    authorize @book

    render json: @book
  end

  def search
    index
    render :index
  end

  def favorite
    if Favorite.exists?(book: @book, user: current_user)
      redirect_to @book, notice: 'Already liked'
    else

      @favorite = Favorite.new(book: @book, user: current_user)

      authorize @favorite, policy_class: BookPolicy

      if @favorite.save
        redirect_to @book, notice: 'The book is placed in favorites'
      else
        redirect_to @book, notice: 'Unexpected error'
      end

    end
  end

  def unfavorite
    @favorite = Favorite.where(book: @book, user: current_user)

    authorize @favorite, policy_class: BookPolicy

    if Favorite.delete @favorite

      redirect_to @book, notice: "Book \"#{@book.title}\" is removed from favorites"
    else
      redirect_to @book, notice: 'Unexpected error'

    end
  end

  def place_book_to_reading_list
    if ReadingList.exists?(book: @book, user: current_user)
      redirect_to @book, notice: 'Already in read list'
    else

      @list = ReadingList.new(book: @book, user: current_user)

      authorize @list, policy_class: BookPolicy

      if @list.save
        redirect_to @book, notice: "\"#{@book.title}\" is placed in a reading list"
      else
        redirect_to @book, notice: 'Unexpected error'
      end
    end
  end

  def remove_from_reading_list
    @list = ReadingList.where(book: @book, user: current_user)

    authorize @list, policy_class: BookPolicy


    if ReadingList.delete @list
      redirect_to @book, notice: "Book \"#{@book.title}\" is removed from reading list"
    else
      redirect_to @book, notice: 'Unexpected error '

    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(
        :title, :author, :genre, :description, :cover)
    end
end
