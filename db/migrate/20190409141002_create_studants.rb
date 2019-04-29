class CreateStudants < ActiveRecord::Migration[5.2]
  def change
    create_table :studants do |t|
      t.string :name
      t.integer :category
      t.string :photo
      t.datetime :deleted_at
      t.timestamps
    end

  end
end
