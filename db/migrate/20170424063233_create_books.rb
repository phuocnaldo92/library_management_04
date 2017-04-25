class CreateBooks < ActiveRecord::Migration[5.0]

  def change
    create_table :books do |t|
      t.integer :category_id
      t.integer :number_of_page
      t.integer :publisher_id
      t.string :total_book
      t.string :title
      t.string :picture
      t.string :description
      t.timestamps
    end
  end
end
