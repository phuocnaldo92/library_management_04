class CreateBorrowBooks < ActiveRecord::Migration[5.0]

  def change
    create_table :borrow_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.date :from_date
      t.date :to_date
      t.integer :number_borrow
      t.string :status
      t.timestamps
    end
  end
end
