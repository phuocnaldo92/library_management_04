class Author < ApplicationRecord

  has_many :user_follow_authors, class_name: UserFollowAuthor.name,
    foreign_key: :author_id, dependent: :destroy
  has_many :ralation_book_authors, class_name: RelationBookAuthor.name,
    foreign_key: :author_id, dependent: :destroy
  mount_uploader :picture, PictureUploader

  scope :get_top3_create, -> (limit) { order("created_at desc").limit(limit) }

  scope :search_author, ->key_word do
    where "name LIKE '%#{key_word}%'" if key_word.present?
  end
end
