class BorrowBook < ApplicationRecord

  belongs_to :user
  belongs_to :book
  validates :number_borrow, presence: true,
    numericality: {greater_than_or_equal_to: Settings.minimum_quantity}
  
  scope :get_all_borrow_1, -> do
    where("status = '1'")
  end

  scope :get_all_borrow_2, -> do
    where("status = '2'")
  end

  scope :count_total_borrow, ->book_id, number_borrow do
    where("book_id = ? and status = '2' ", book_id)
      .pluck("coalesce(sum(number_borrow), 0)")[0] + number_borrow
  end
end
