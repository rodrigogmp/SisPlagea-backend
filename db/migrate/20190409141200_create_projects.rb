class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
