class Book < ApplicationRecord

  belongs_to :category
  belongs_to :publisher
  has_many :ralation_book_authors, class_name: RelationBookAuthor.name,
    foreign_key: :book_id, dependent: :destroy
  has_many :borrow_books, class_name: BorrowBook.name,
    foreign_key: :book_id, dependent: :destroy
  mount_uploader :picture, PictureUploader

  scope :get_top6_create, -> (limit) { order("created_at desc").limit(limit) }

  scope :get_book_by_id, ->id do
    where("id = ?", id)[0]
  end
end
