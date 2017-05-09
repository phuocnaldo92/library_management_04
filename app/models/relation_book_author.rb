class RelationBookAuthor < ApplicationRecord

  belongs_to :author
  belongs_to :book
  validates :book_id, presence: true
  validates :author_id, presence: true

  scope :get_book, ->author_id do
    where("author_id = ? ", author_id)
  end
end
