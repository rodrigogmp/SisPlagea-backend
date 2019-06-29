class CreateBibtexes < ActiveRecord::Migration[5.2]
  def change
    create_table :bibtexes do |t|
      t.string :file
      t.timestamps
    end
  end
end
