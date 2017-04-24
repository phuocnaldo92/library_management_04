class CreateUserFollowAuthors < ActiveRecord::Migration[5.0]

  def change
    create_table :user_follow_authors do |t|
      t.integer :user_id
      t.integer :author_id
      t.timestamps
    end
  end
end
