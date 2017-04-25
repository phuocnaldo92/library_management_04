class CreateAuthors < ActiveRecord::Migration[5.0]

  def change
    create_table :authors do |t|
      t.string :name
      t.string :sub_name
      t.date :birth_date
      t.date :death_date
      t.string :style
      t.timestamps
    end
  end
end
