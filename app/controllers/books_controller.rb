class BooksController < ApplicationController
  def index
    @books = Book.filter_by_title_starts_with(params[:search])
  end
end
