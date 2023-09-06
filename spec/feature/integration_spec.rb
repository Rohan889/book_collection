# spec/features/books_integration_spec.rb

require 'rails_helper'

RSpec.describe 'Adding a book', type: :feature do
  it 'adds book' do
    visit new_book_path
    fill_in 'Title', with: 'Sample Book'
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    expect(Book.last.title).to eq('Sample Book')
  end

  it 'displays flash notice' do
    visit new_book_path

    fill_in 'Title', with: ''
    click_button 'Create Book'

    expect(page).to have_content("Should be bklank ")
    expect(current_path).to eq(books_path)
  end
  it 'issue with author' do
    visit new_book_path

    fill_in 'Title', with: 'Dr.Suess'
    fill_in 'Author', with: 'Dr.Suess'
    fill_in 'Price', with: '19.99'
    click_button 'Create Book'

    expect(page).to have_content("Author can't be blank")
    expect(current_path).to eq(books_path)
  end
  it 'Price is wrong' do
    visit new_book_path

    fill_in 'Title', with: 'Crime and Punishment'
    fill_in 'Author', with: 'Fyodo'
    fill_in 'Price', with: 'a'

    click_button 'Create Book'

    expect(page).to have_content('Price is not a number')
    expect(current_path).to eq(books_path)
  end
end
