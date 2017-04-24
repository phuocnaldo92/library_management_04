class CreateUserActionBooks < ActiveRecord::Migration[5.0]

  def change
    create_table :user_action_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :action
      t.string :comment
      t.timestamps
    end
  end
end
