class CreateRelationBookAuthors < ActiveRecord::Migration[5.0]

  def change
    create_table :relation_book_authors do |t|
      t.integer :book_id
      t.string :author_id
      t.string :integer
      t.timestamps
    end
  end
end
