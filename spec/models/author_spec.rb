require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'when author is deleted' do
    it 'deletes books' do
      author = Author.create
      book   = Book.create(author: author, title: 'foo')

      expect { author.destroy }.to change(Book, :count).by(-1)
    end
  end

  describe '#full_name' do
    it 'returns first and last name' do
      author = build(:author, first_name: 'foo', last_name: 'bar')

      result = author.full_name

      expect(result).to eq('foo bar')
    end
  end
end
