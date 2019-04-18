class CreateStudants < ActiveRecord::Migration[5.2]
  def change
    create_table :studants do |t|
      t.string :name
      t.integer :category
      t.text :abstract
      t.string :photo
      t.integer :start_year
      t.integer :end_year
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
