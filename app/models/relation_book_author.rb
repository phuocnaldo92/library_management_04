class RelationBookAuthor < ApplicationRecord

  belongs_to :author
  belongs_to :book
  validates :book_id, presence: true
  validates :author_id, presence: true
end
