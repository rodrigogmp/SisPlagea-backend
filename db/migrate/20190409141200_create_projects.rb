class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :abstract
      t.integer :start_year
      t.integer :end_year
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
