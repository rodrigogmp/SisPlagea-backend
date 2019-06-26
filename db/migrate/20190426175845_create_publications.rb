class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :journal
      t.integer :category
      t.integer :year
      t.integer :volume
      t.integer :pages
      t.string :authors
      t.string :file_to_upload
      t.timestamps
    end
  end
end
