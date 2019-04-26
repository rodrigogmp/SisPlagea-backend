class CreateStudyGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :study_groups do |t|
      
      t.timestamps
    end
  end
end
