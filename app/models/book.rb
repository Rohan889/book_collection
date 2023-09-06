class Book < ApplicationRecord
    #validates :title, presence: true
    validates :author, presence: true
    #Making sure that that the objects has price and author 
    validates :price, numericality: { greater_than_or_equal_to: 0 }
end
