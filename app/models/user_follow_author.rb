class UserFollowAuthor < ApplicationRecord

  belongs_to :user
  belongs_to :author

  scope :count_record, ->user_id, author_id do
     where("user_id = ? and author_id = ?", user_id, author_id).pluck("count(*)")[0]
  end
end
