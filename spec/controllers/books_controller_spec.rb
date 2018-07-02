require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:user) { build(User) }
  let(:book) { FactoryBot.create(:book) }

  subject do
    described_class.new :book
  end

  let(:valid_attributes) do { title: "a", author: "b" } end

  let(:invalid_attributes) do
    { title: nil, author: nil }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.create(title: "a", author: "b")

      get :show, params: { id: book.to_param }, session: {}
      expect(response).to have_http_status(:ok)

    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.create(title: "a", author: "b")

      get :edit, params: { id: book.to_param }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect do
          post :create, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: { book: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { book: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { title: "aa", author: "bb" }
      end

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: { id: book.to_param, book: new_attributes }
        book.reload
        expect(book.title).to eq("aa")
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: { id: book.to_param, book: valid_attributes }
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        put :update, params: { id: book.to_param, book: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect do
        delete :destroy, params: { id: book.to_param }, session: valid_session
      end.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, params: { id: book.to_param }, session: valid_session
      expect(response).to redirect_to(books_url)
    end
  end
end
