require 'rails_helper'

RSpec.describe 'Browsing', type: :system do
  before do
    salinger = create(:author, first_name: 'J.D.', last_name: 'Salinger')
    tolstoy  = create(:author, first_name: 'Leo', last_name: 'Tolstoy')

    create(:book, author: salinger, title: 'Catcher in the rye')
    create(:book, author: tolstoy, title: 'Peace and War')
  end

  it 'enables user to find a book when the book exists' do
    visit '/'

    click_link 'Books'

    fill_in 'Search', with: 'Catcher in the rye'

    click_button 'Search'

    expect(page).to     have_text('1 results')
    expect(page).to     have_text('J.D. Salinger')
    expect(page).not_to have_text('Leo Tolstoy')
  end

  it 'displays an error message to user when the book does not exist' do
    visit '/'

    click_link 'Books'

    fill_in 'Search', with: 'Xyzzy'

    click_button 'Search'

    expect(page).to have_text('0 results')
  end
end
