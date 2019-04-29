class CreateGroupParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :group_participants do |t|
      t.references :studant, foreign_key: true
      t.references :study_group, foreign_key: true

      t.timestamps
    end
  end
end
