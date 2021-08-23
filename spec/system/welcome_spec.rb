require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  it 'enables user to see welcome page' do
    visit '/'

    expect(page).to have_title('Home')
    expect(page).to have_text('Welcome!')
  end
end
