require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is invalid when author is nil and title is not blank' do
    book   = Book.new(author: nil, title: 'foo')
    result = book.valid?

    expect(result).to be false
  end

  it 'is invalid when author is not nil and title is blank' do
    author = Author.new
    book   = Book.new(author: author, title: '   ')
    result = book.valid?

    expect(result).to be false
  end

  describe '.filter_by_title_starts_with' do
    it 'returns books where title matches the search exactly' do
      book = create(:book, title: 'The Blue Book')
      result = Book.filter_by_title_starts_with('The Blue Book')

      expect(result).to include(book)
    end

    it 'returns books where start of the title matches the search' do
      book = create(:book, title: 'The Yellow Book')
      result = Book.filter_by_title_starts_with('The Yell')

      expect(result).to include(book)
    end

    it 'does not return books where start of the title does not match search' do
      book = create(:book, title: 'The Green Book')
      result = Book.filter_by_title_starts_with('The Red')

      expect(result).not_to include(book)
    end
  end
end
