# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  login_user

  let!(:valid_book) { create :book }

  let!(:invalid_book) { { title: nil } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end


  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: valid_book.id }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: valid_book.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Book' do
        expect {
          post :create, params: { book: attributes_for(:book) }
        }.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post :create, params: { book: attributes_for(:book) }
        expect(response).to redirect_to(Book.last)
      end
    end

    context 'with invalid params' do
      before(:each) do
        post :create, params: { book: { title: nil } }
      end

      it 'does not create a new book' do
        expect(Book.count).to eq(1)
      end

      it 'redirects to new' do
        expect(response).to redirect_to(new_book_path)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let!(:new_attributes) {
        { title: 'New title', author: 'New author' }
      }

      it 'updates the requested book' do
        put :update, params: { id: valid_book.id, book: new_attributes }
        valid_book.reload
        expect(valid_book.title).to eq('New title')
      end

      it 'redirects to the book' do
        put :update, params: { id: valid_book.id, book: new_attributes }
        expect(response).to redirect_to(valid_book)
      end
    end

    context 'with invalid params' do
      it 'does not update the book' do
        put :update, params: { id: valid_book.id, book: invalid_book }
        expect(Book.last.title).not_to eq(invalid_book[:title])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book' do
      expect {
        delete :destroy, params: { id: valid_book.to_param }
      }.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      delete :destroy, params: { id: valid_book.to_param }
      expect(response).to redirect_to(books_url)
    end
  end
end
