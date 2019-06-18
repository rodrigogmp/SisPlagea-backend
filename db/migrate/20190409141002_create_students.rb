class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :category
      t.string :photo
      t.string :email
      t.string :registration
      t.string :lattes_link
      t.string :relevant_informations
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :students, :email,                unique: true

  end
end
