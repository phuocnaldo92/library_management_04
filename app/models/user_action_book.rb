class UserActionBook < ApplicationRecord

  belongs_to :user
  belongs_to :book
  scope :count_rating, ->book_id do
    where("book_id = ? and comment is null", book_id).pluck("count(*)")[0]
  end

  scope :rating_for_show, -> do
    where("comment is null").group("book_id")
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

  scope :get_commet, ->book_id do
    where("book_id = ?  and action = 6", book_id)
  end

  scope :count_like, ->book_id do
    where("book_id = ? and comment is null and action = 7", book_id).pluck("count(*)")[0]
  end

  scope :count_like_with_user, ->book_id, user_id do
    where("book_id = ? and comment is null and action = 7 and user_id = ?", book_id, user_id).pluck("count(*)")[0]
  end

  scope :get_like, ->book_id do
    where("book_id = ? and comment is null and action = 7", book_id)
  end
end
