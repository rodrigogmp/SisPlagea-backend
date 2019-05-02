class CreateProjectParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :project_participants do |t|
      t.references :student, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :start_year
      t.integer :end_year
      t.string :file_to_upload
      t.timestamps
    end
  end
end
