class UserActionBook < ApplicationRecord

  belongs_to :user
  scope :count_rating, ->book_id do
    where("book_id = ? and comment is null", book_id).pluck("count(*)")[0]
  end

  scope :count_point_rating, ->book_id do
    where("book_id = ? and comment is null", book_id)
      .pluck("sum(action)")[0].to_f / count_rating(book_id)
  end

  scope :check_exist_rating, ->book_id, user_id do
    where("book_id = ? and user_id = ? and comment is null", book_id, user_id)
      .pluck("count(*)")[0]
  end

  scope :get_exist_rating, ->book_id, user_id do
    where("book_id = ? and user_id = ? and comment is null", book_id, user_id)[0]
  end

  scope :get_exist_like, ->book_id do
    where("book_id = ? and user_id = ? and comment is null and action = 6", book_id, user_id)[0]
  end
end
