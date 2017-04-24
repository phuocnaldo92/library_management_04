class Publisher < ApplicationRecord

  has_many :books, class_name: Book.name,
    foreign_key: :publisher_id, dependent: :destroy
end
