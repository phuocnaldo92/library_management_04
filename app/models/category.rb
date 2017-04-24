class Category < ApplicationRecord

  has_many :books, class_name: Book.name,
    foreign_key: :category_id, dependent: :destroy
  validates :title, presence: true,
    length: {maximum: Settings.maximum_category_length}
end
