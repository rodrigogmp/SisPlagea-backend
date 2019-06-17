class CreateStudyGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :study_groups do |t|
      t.string :name
      t.integer :create_year
      t.string :leaders
      t.string :predominant_area
      t.string :objective
      t.timestamps
    end
  end
end
