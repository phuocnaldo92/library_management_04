require 'csv'
class User < ApplicationRecord

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:
    {maximum: Settings.maximum_email_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_follow_authors, class_name: UserFollowAuthor.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :borrow_books, class_name: BorrowBook.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :user_action_books, class_name: UserActionBook.name,
    foreign_key: :user_id, dependent: :destroy

  scope :get_all_user_not_is_admin, -> do
    where("role not in (0)")
  end

  def self.to_csv
    attributes = %w{id email}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
