class Author < ApplicationRecord

  has_many :user_follow_authors, class_name: UserFollowAuthor.name,
    foreign_key: :author_id, dependent: :destroy
  has_many :ralation_book_authors, class_name: RelationBookAuthor.name,
    foreign_key: :author_id, dependent: :destroy
end
