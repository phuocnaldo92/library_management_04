class Book < ApplicationRecord

  belongs_to :category
  belongs_to :publisher
  has_many :ralation_book_authors, class_name: RelationBookAuthor.name,
    foreign_key: :book_id, dependent: :destroy
  has_many :borrow_books, class_name: BorrowBook.name,
    foreign_key: :book_id, dependent: :destroy
end
