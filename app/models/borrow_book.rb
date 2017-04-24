class BorrowBook < ApplicationRecord

  belongs_to :user
  belongs_to :book
  validates :number_borrow, presence: true,
    numericality: {greater_than_or_equal_to: Settings.minimum_quantity}
end
