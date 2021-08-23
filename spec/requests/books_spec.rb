require 'rails_helper'

RSpec.describe "Books", type: :request do
  before do
    create(:book, title: 'The Blue Book')
  end

  describe "GET /books" do
    it "returns http success without books when search is blank" do
      get "/books"

      expect(response).to have_http_status(:success)
    end

    it "returns http success with books when search is not blank" do
      get "/books", params: { search: "The Blue" }

      expect(assigns(:books)).not_to be_empty
      expect(response).to have_http_status(:success)
    end
  end
end
