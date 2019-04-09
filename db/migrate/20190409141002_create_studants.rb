class CreateStudants < ActiveRecord::Migration[5.2]
  def change
    create_table :studants do |t|
      t.string :name
      t.string :category
      t.text :abstract
      t.integer :start_year
      t.integer :end_year

      t.timestamps
    end
  end
end
