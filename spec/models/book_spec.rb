# spec/models/book_spec.rb

require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'for title' do
    book = Book.new(title: '')
    expect(book).to_not be_valid
  end

   it 'for author' do
      book = Book.new(author: '')
      expect(book).to_not be_valid
  end
  it 'for price' do
    book = Book.new(price: nil)
    expect(book).to_not be_valid
  end
  

    
end
