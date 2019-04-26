class CreateStudants < ActiveRecord::Migration[5.2]
  def change
    create_table :studants do |t|
      t.string :name
      t.integer :category
      t.datetime :deleted_at
      t.integer :project_id
      t.timestamps
    end

  end
end
